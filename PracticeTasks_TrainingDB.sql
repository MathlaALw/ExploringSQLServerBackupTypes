
-- Part 2: Practice Tasks (using a test database like TrainingDB) 



-- Step 1: Create Test Database

CREATE DATABASE TrainingDB; 
GO 
USE TrainingDB; 
GO 
CREATE TABLE Students ( 
    StudentID INT PRIMARY KEY, 
    FullName NVARCHAR(100), 
    EnrollmentDate DATE 
); 

-- Step 2: Insert Sample Data**

INSERT INTO Students VALUES  
(1, 'Sara Ali', '2023-09-01'), 
(2, 'Mohammed Nasser', '2023-10-15'); 


Select * from Students;


---

-- Step 2: Perform Backup Operations
-- 1. Full Backup
BACKUP DATABASE TrainingDB TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Full.bak';

-- 2. Insert New Record (simulate data change)
INSERT INTO Students VALUES (3, 'Fatma Said', '2024-01-10');

-- 3. Differential Backup
BACKUP DATABASE TrainingDB TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Diff.bak' WITH DIFFERENTIAL;

-- 4. Transaction Log Backup
-- First make sure Recovery Model is FULL
ALTER DATABASE TrainingDB SET RECOVERY FULL;
-- Now backup the log
BACKUP LOG TrainingDB TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Log.trn';

-- 5. Copy-Only Backup
BACKUP DATABASE TrainingDB TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_CopyOnly.bak' WITH
COPY_ONLY;


---------------

-- Follow-Up Task: Restore the Database from Your Backup Files

-- Scenario:

-- Emergency Recovery Simulation for TrainingDB

-- Today, you practiced backing up your database TrainingDB using different types of backups: 
-- - Full Backup 
-- - Differential Backup 
-- - Transaction Log Backup 
-- - Copy-Only Backup 

-- Now simulate this real-world problem:

-- This afternoon, the TrainingDB system crashed. Your manager asks you to **recover the 
-- database up to the last transaction log backup** you made. Your goal is to bring the database 
-- back to the most recent state — using your backup files only.

-- Instructions:

--Step 1: Drop the Current Database (Simulate System Failure)**

DROP DATABASE TrainingDB;

-- Error Solutions
ALTER DATABASE TrainingDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;


-- Step 2: Restore from Your Backups
-- Use the same file names and paths you used earlier. Replace them accordingly. 

-- 1. Restore FULL backup

RESTORE DATABASE TrainingDB  
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Full.bak' 
WITH NORECOVERY; 

-- 2. Restore DIFFERENTIAL backup (if you created one)

RESTORE DATABASE TrainingDB  
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Diff.bak' 
WITH NORECOVERY; 


-- 3. Restore TRANSACTION LOG backup (if you created one)

RESTORE LOG TrainingDB  
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\TrainingDB_Log.trn' 
WITH RECOVERY; 



-- Use WITH NORECOVERY until the final step. 
-- Use WITH RECOVERY only at the last step. 


-- Step 3: Verify the Restored Data

USE TrainingDB; 
SELECT * FROM Students; 






















-------------------

-- Backup for HospitalDB

-- Full Backup Script (Run Every Sunday at 12:00 AM)
BACKUP DATABASE HospitalDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalDB_Backups\Full\HospitalDB_Full_$(ESCAPE_NONE(WEEKDAY))_$(ESCAPE_NONE(DATE))_0000.bak'
WITH FORMAT, INIT, NAME = 'Full Backup of HospitalDB';

-- Differential Backup Script (Run Monday to Saturday at 12:00 AM)
BACKUP DATABASE HospitalDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalDB_Backups\Differential\HospitalDB_Diff_$(ESCAPE_NONE(WEEKDAY))_$(ESCAPE_NONE(DATE))_0000.bak'
WITH DIFFERENTIAL, INIT, NAME = 'Differential Backup of HospitalDB';

-- Transaction Log Backup Script (Run Every Hour)
BACKUP LOG HospitalDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\HospitalDB_Backups\Logs\HospitalDB_Log_$(ESCAPE_NONE(DATE))_$(ESCAPE_NONE(TIME)).trn'
WITH INIT, NAME = 'Transaction Log Backup of HospitalDB';



-------------------------------------------

