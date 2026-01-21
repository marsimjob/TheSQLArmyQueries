-- Creating tables
USE ArmyOperationsDB;
GO

-- Table that holds informations about rank names related to rankID (Sergant/Private etc)
CREATE TABLE [Rank] (
RankID INT IDENTITY (1,1) PRIMARY KEY,                  
RankName VARCHAR(50) NOT NULL UNIQUE -- Unique rank name so no multiple entries are found
);
GO

-- Unit table that hold military units (squad/platoon/company/battalion etc)
CREATE TABLE Unit (
UnitID INT IDENTITY(1,1) PRIMARY KEY,                   
UnitName VARCHAR(16) NOT NULL UNIQUE,    
BaseLocation VARCHAR(50) NOT NULL        
);
GO

-- Tabel that holds the viechles we use, tanks, jeeps, helicopters
CREATE TABLE Vehicle (
VehicleID INT IDENTITY(1,1) PRIMARY KEY,                
VehicleType VARCHAR(50) NOT NULL,         
Model VARCHAR(50) NOT NULL,               
CrewCapacity INT NOT NULL                 
);
GO

--Stores available weapon types as a tabel
CREATE TABLE Weapon (
WeaponID INT IDENTITY(1,1) PRIMARY KEY,                 
WeaponType VARCHAR(50) NOT NULL,          
Caliber VARCHAR(20),                      
RangeMeters INT                           
);
GO
-- A table that stores individual soldiers
CREATE TABLE Soldier
(
SoldierID INT IDENTITY(1,1) PRIMARY KEY, -- Auto incrementing with Identity
FirstName VARCHAR(16),
LastName VARCHAR(16),
BirthDate DATE,
Deseased BIT NULL,
PassingDate DATE NULL,
RankID INT NOT NULL,
UnitID INT NOT NULL,
-- CONSTRAINTS FOR MY FOREIGN KEYS
CONSTRAINT FK_Soldier_Rank FOREIGN KEY (RankID) REFERENCES [Rank] (RankID),          
CONSTRAINT FK_Soldier_Unit FOREIGN KEY (UnitID) REFERENCES Unit (UnitID)    
)
GO
-- SoldierWeapon that combines Soldiers and their weapons for Normalization optimizaiton
CREATE TABLE SoldierWeapon (
SoldierID INT NOT NULL,                
WeaponID INT NOT NULL,                 
PRIMARY KEY (SoldierID, WeaponID), -- Composite key forces each Weapon-to-Soldier deligation as a unique.
FOREIGN KEY (SoldierID) REFERENCES Soldier (SoldierID),
FOREIGN KEY (WeaponID) REFERENCES Weapon (WeaponID)   
);
GO
-- Mission table to check what mission soldiers are assigned to
CREATE TABLE Mission (
MissionID INT IDENTITY(1,1) PRIMARY KEY,        
MissionName VARCHAR(100) NOT NULL,
StartDate DATE NOT NULL,          
EndDate DATE                      
);
GO
-- Mission table to check what mission soldiers are assigned to, many to many relationship and N3
CREATE TABLE MissionUnit (
MissionID INT NOT NULL,
UnitID INT NOT NULL,
PRIMARY KEY (MissionID, UnitID), -- Composite PK enforces that each mission‑unit assignment is unique.
FOREIGN KEY (MissionID) REFERENCES Mission (MissionID),
FOREIGN KEY (UnitID) REFERENCES Unit (UnitID)
);