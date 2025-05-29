-- Create HospitalDB

CREATE DATABASE HospitalDB;
   

USE HospitalDB;


-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL
);

-- Create Doctors table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


-- Create Patients table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE,
    Gender NVARCHAR(10)
);


-- Create Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Reason NVARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);


-- Insert sample data into Departments
INSERT INTO Departments (DepartmentName)
VALUES 
('Cardiology'),
('Neurology'),
('Pediatrics'),
('Orthopedics');


-- Insert sample data into Doctors
INSERT INTO Doctors (FirstName, LastName, DepartmentID)
VALUES
('Alice', 'Smith', 1),
('Bob', 'Johnson', 2),
('Carol', 'Williams', 3),
('David', 'Brown', 4);


-- Insert sample data into Patients
INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender)
VALUES
('John', 'Doe', '1985-03-15', 'Male'),
('Jane', 'Doe', '1990-07-22', 'Female'),
('Emily', 'Clark', '2001-11-30', 'Female'),
('Michael', 'Lee', '1975-01-05', 'Male');


-- Insert sample data into Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Reason)
VALUES
(1, 1, '2025-06-01 09:00', 'Heart Checkup'),
(2, 2, '2025-06-01 10:30', 'Migraine'),
(3, 3, '2025-06-01 11:00', 'Vaccination'),
(4, 4, '2025-06-01 12:15', 'Back Pain');




--Description:
--This script defines a comprehensive backup strategy for the HospitalDB database. The plan includes:
-- - Weekly full backups
-- - Daily differential backups
-- - Hourly transaction log backups

-- Backup Types:
-- 1. Full Backup: Taken every Sunday at 12:00 AM to provide a full snapshot.
-- 2. Differential Backup: Taken Monday through Saturday at 12:00 AM, capturing changes since the last full backup.
-- 3. Transaction Log Backup: Taken every hour to support point-in-time recovery.

-- File Naming Convention:
-- <DatabaseName>_<BackupType>_YYYYMMDD_HHMM.<ext>
-- Example: HospitalDB_Full_20250525_0000.bak

-- Folder Structure:
-- D:\HospitalDB_Backups\
-- ├── Full\
-- ├── Differential\
-- └── Logs\


-- FULL BACKUP - Run Every Sunday at 12:00 AM

BACKUP DATABASE HospitalDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalDB_Full_20250525_0000.bak'
WITH FORMAT, INIT, NAME = 'Full Backup of HospitalDB';

-- DIFFERENTIAL BACKUP - Run Monday to Saturday at 12:00 AM
BACKUP DATABASE HospitalDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalDB_Diff_20250529_0000.bak'
WITH DIFFERENTIAL, INIT, NAME = 'Differential Backup of HospitalDB';


-- TRANSACTION LOG BACKUP - Run Every Hour
BACKUP LOG HospitalDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalDB_Log_20250529_1300.trn'
WITH INIT, NAME = 'Transaction Log Backup of HospitalDB';

