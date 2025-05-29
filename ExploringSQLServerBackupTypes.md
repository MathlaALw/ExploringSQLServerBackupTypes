# Task: Exploring SQL Server Backup Types 
 
## Part 1: Research Task 

### Objective: 
Understand the different types of backup available in SQL Server. 
### Instructions:
**1. Search for and summarize the following backup types:** 

**a. Full Backup** -> A full backup captures the entire database at a specific point in time, including all data and objects. It is the foundation for other types of backups.

**b. Differential Backup** -> A differential backup captures only the data that has changed since the last full backup. It is faster than a full backup and requires less storage space.

**c. Transaction Log Backup** -> A transaction log backup captures all the transactions that have occurred since the last transaction log backup. It allows for point-in-time recovery and is essential for databases in full recovery mode.

**d. Copy-Only Backup** -> A copy-only backup is a special type of backup that does not affect the sequence of regular backups. It is used for ad-hoc backups without disrupting the backup chain.

**e. File/Filegroup Backup** -> A file or filegroup backup allows you to back up specific files or filegroups within a database. This is useful for large databases where you may want to back up only certain parts without affecting the entire database.

**2. For each backup type, include:** 

**a. When it is used**

**b. What it includes**

**c. Pros & cons**

**d. Real-world scenario (e.g., banking system, e-learning platform, ticketing system)**

### Deliverable: 

Write your findings in a simple report (1–2 pages). Use diagrams if needed.

# Exploring SQL Server Backup Types

| Backup Type            | When Used                                          | What It Includes                                        | Pros                                                              | Cons                                                    | Real-World Scenario                                                      |
|------------------------|----------------------------------------------------|---------------------------------------------------------|-------------------------------------------------------------------|---------------------------------------------------------|--------------------------------------------------------------------------|
| Full Backup            | Initial backup or periodic backups                 | Entire database, all data and objects                   | Comprehensive, allows for complete recovery                       | Time-consuming, large storage requirement               | Banking system: Initial full backup of customer data                     |
| Differential Backup    | After a full backup, for changes                   | Data changed since the last full backup                 | Faster than full backup, less storage needed                      | Cannot restore without a full backup                    | E-learning platform: Daily backups of course content                     |
| Transaction Log Backup | Continuous, after each transaction log backup      | All transactions since the last log backup              | Point-in-time recovery, essential for full recovery mode          | Requires regular backups, can grow large                | Ticketing system: Frequent updates to ticket status                      |
| Copy-Only Backup       | Ad-hoc backups, without disrupting regular backups | Does not affect backup sequence, captures current state | Useful for one-time backups, does not interfere with backup chain | Not suitable for regular backups, can lead to confusion | E-learning platform: Backup of course content before major updates       |
| File/Filegroup Backup  | For large databases, specific parts                | Specific files or filegroups within a database          | Saves time and storage, allows selective backups                  | Complexity in management, requires careful planning     | Banking system: Backing up only transaction logs and customer data files |

---------------------------