
USE ArmyOperationsDB
GO

-- Displaying CRUD operations by INSERTING new members to the tables

-- New Ranks
INSERT INTO [Rank] (RankName)
VALUES
('Major'),
('Warrant Officer');
GO

-- New Units
INSERT INTO Unit (UnitName, BaseLocation)
VALUES
('Delta Force', 'USA'),
('EZ Squad', 'Poland'),
('Liberators', 'Italy'),
GO

-- New Weapons
INSERT INTO Weapon (WeaponType, Caliber, RangeMeters)
VALUES
('Grenade Launcher', '40mm', 400),
('Anti-Tank Missile', 'ATGM', 2500);
GO

INSERT INTO Soldier (FirstName, LastName, BirthDate, RankID, UnitID) VALUES
('Elton','Larsson','1993-05-30',1,3),
('Eva','Röndalh','1994-09-05',1,3);

-- New Weapon on Soldier
INSERT INTO SoldierWeapon (SoldierID, WeaponID)
VALUES
(5, 3),
(4, 5);  

-- Add three new missions
INSERT INTO Mission (MissionName, StartDate, EndDate)
VALUES
('Operation Iron Shield', '2026-07-01', '2026-07-14'),
('Midnight Recon',      '2026-07-15', '2026-07-16'),
('Desert Watch',        '2026-07-20', NULL);
GO