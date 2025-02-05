-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: Week3Mermaid
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `CoachID` int unsigned NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `CoachingExperienceYears` int unsigned DEFAULT NULL,
  PRIMARY KEY (`CoachID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match` (
  `MatchID` int unsigned NOT NULL,
  `MatchDate` datetime DEFAULT NULL,
  `Venue` varchar(100) DEFAULT NULL,
  `Result` int unsigned DEFAULT NULL,
  PRIMARY KEY (`MatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `PlayerID` int unsigned NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `Nationality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerskills`
--

DROP TABLE IF EXISTS `playerskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerskills` (
  `SkillID` int unsigned NOT NULL,
  `SkillName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SkillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerskills`
--

LOCK TABLES `playerskills` WRITE;
/*!40000 ALTER TABLE `playerskills` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerskillsplayer`
--

DROP TABLE IF EXISTS `playerskillsplayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerskillsplayer` (
  `PlayerID` int unsigned NOT NULL,
  `SkillID` int unsigned NOT NULL,
  PRIMARY KEY (`PlayerID`,`SkillID`),
  KEY `SkillID` (`SkillID`),
  CONSTRAINT `playerskillsplayer_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `playerskillsplayer_ibfk_2` FOREIGN KEY (`SkillID`) REFERENCES `playerskills` (`SkillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerskillsplayer`
--

LOCK TABLES `playerskillsplayer` WRITE;
/*!40000 ALTER TABLE `playerskillsplayer` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerskillsplayer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerteammatch`
--

DROP TABLE IF EXISTS `playerteammatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerteammatch` (
  `PlayerID` int unsigned NOT NULL,
  `MatchID` int unsigned NOT NULL,
  `TeamID` int unsigned NOT NULL,
  PRIMARY KEY (`PlayerID`,`MatchID`,`TeamID`),
  KEY `MatchID` (`MatchID`),
  KEY `TeamID` (`TeamID`),
  CONSTRAINT `playerteammatch_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `playerteammatch_ibfk_2` FOREIGN KEY (`MatchID`) REFERENCES `match` (`MatchID`),
  CONSTRAINT `playerteammatch_ibfk_3` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerteammatch`
--

LOCK TABLES `playerteammatch` WRITE;
/*!40000 ALTER TABLE `playerteammatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerteammatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `TeamID` int unsigned NOT NULL,
  `TeamName` varchar(100) DEFAULT NULL,
  `TeamCountry` varchar(100) DEFAULT NULL,
  `CoachID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `CoachID` (`CoachID`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`CoachID`) REFERENCES `coach` (`CoachID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teamtournament`
--

DROP TABLE IF EXISTS `teamtournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teamtournament` (
  `TeamID` int unsigned NOT NULL,
  `TournamentID` int unsigned NOT NULL,
  PRIMARY KEY (`TeamID`,`TournamentID`),
  KEY `TournamentID` (`TournamentID`),
  CONSTRAINT `teamtournament_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `teamtournament_ibfk_2` FOREIGN KEY (`TournamentID`) REFERENCES `tournament` (`TournamentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamtournament`
--

LOCK TABLES `teamtournament` WRITE;
/*!40000 ALTER TABLE `teamtournament` DISABLE KEYS */;
/*!40000 ALTER TABLE `teamtournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament` (
  `TournamentID` int unsigned NOT NULL,
  `TournamentName` varchar(100) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `MatchID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`TournamentID`),
  KEY `MatchID` (`MatchID`),
  CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `match` (`MatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament`
--

LOCK TABLES `tournament` WRITE;
/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Week3Mermaid'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-05 14:23:42
