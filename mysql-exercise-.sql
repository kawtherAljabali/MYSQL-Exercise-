-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2020 at 11:53 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mysql-exercise-`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `COUNTRY_ID` int(2) NOT NULL,
  `COUNTRY_NAME` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REGION_ID` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries3`
--

CREATE TABLE `countries3` (
  `COUNTRY_ID` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `COUNTRY_NAME` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `REGION_ID` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries4`
--

CREATE TABLE `countries4` (
  `COUNTRY_ID` int(11) NOT NULL,
  `COUNTRY_NAME` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `REGION_ID` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DEPARTMENT_ID` decimal(4,0) NOT NULL,
  `DEPARTMENT_NAME` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `MANAGER_ID` decimal(6,0) NOT NULL,
  `LOCATION_ID` decimal(4,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dup_countries`
--

CREATE TABLE `dup_countries` (
  `COUNTRY_ID` int(2) NOT NULL,
  `COUNTRY_NAME` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REGION_ID` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL,
  `FIRST_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `PHONE_NUMBER` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `JOB_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `JOB_TITLE` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `MIN_SALARY` float DEFAULT NULL,
  `MAX_SALARY` float DEFAULT NULL CHECK (`MAX_SALARY` <= 25000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs2`
--

CREATE TABLE `jobs2` (
  `JOB_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `JOB_TITLE` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT ' ',
  `MIN_SALARY` decimal(6,0) DEFAULT 8000,
  `MAX_SALARY` decimal(6,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_history`
--

CREATE TABLE `job_history` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL CHECK (`END_DATE` like '--/--/----'),
  `JOB_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `DEPARTMENT_ID` decimal(4,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_history2`
--

CREATE TABLE `job_history2` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `JOB_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`COUNTRY_ID`);

--
-- Indexes for table `countries3`
--
ALTER TABLE `countries3`
  ADD PRIMARY KEY (`COUNTRY_ID`);

--
-- Indexes for table `countries4`
--
ALTER TABLE `countries4`
  ADD PRIMARY KEY (`COUNTRY_NAME`),
  ADD UNIQUE KEY `COUNTRY_ID` (`COUNTRY_ID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DEPARTMENT_ID`,`MANAGER_ID`);

--
-- Indexes for table `dup_countries`
--
ALTER TABLE `dup_countries`
  ADD PRIMARY KEY (`COUNTRY_ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`,`MANAGER_ID`);

--
-- Indexes for table `jobs2`
--
ALTER TABLE `jobs2`
  ADD UNIQUE KEY `JOB_ID` (`JOB_ID`);

--
-- Indexes for table `job_history2`
--
ALTER TABLE `job_history2`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD KEY `JOB_ID` (`JOB_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `COUNTRY_ID` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries4`
--
ALTER TABLE `countries4`
  MODIFY `COUNTRY_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dup_countries`
--
ALTER TABLE `dup_countries`
  MODIFY `COUNTRY_ID` int(2) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DEPARTMENT_ID`,`MANAGER_ID`) REFERENCES `departments` (`DEPARTMENT_ID`, `MANAGER_ID`);

--
-- Constraints for table `job_history2`
--
ALTER TABLE `job_history2`
  ADD CONSTRAINT `job_history2_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs2` (`JOB_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
