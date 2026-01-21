USE ArmyOperationsDB;
GO
-- Thanks for the quick Seed Data, ChatGPT!
-- 1) Add Ranks first
INSERT INTO [Rank] (RankName) VALUES
('Private'),
('5Corporal'),
('Sergeant'),
('Lieutenant'),
('Captain');
GO
-- 2) Add Units
INSERT INTO Unit (UnitName, BaseLocation) VALUES
('Alpha Company', 'Camp Echo'),
('Bravo Platoon', 'Fort Bravo'),
('Charlie Squad', 'Camp Delta');
GO
-- 3) Add Missions
INSERT INTO Mission (MissionName, StartDate, EndDate) VALUES
('Operation Dawn', '2026-02-01', '2026-02-10'),
('Recon Patrol', '2026-03-05', '2026-03-07');
GO
-- 4) Add Weapons
INSERT INTO Weapon (WeaponType, Caliber, RangeMeters) VALUES
('Assault Rifle','5.56mm',500),
('Machine Gun','7.62mm',1000),
('Sniper Rifle','.308',1200);
GO
-- 5) Add Vehicles
INSERT INTO Vehicle (VehicleType, Model, CrewCapacity) VALUES
('Tank','Leopard 2A6',4),
('Jeep','VW Kubelwagen',2),
('Helicopter','AH-64 Apache',2);
GO
-- 6) Add Soldiers WITH valid RankID and UnitID
INSERT INTO Soldier (FirstName, LastName, BirthDate, RankID, UnitID) VALUES
('Erik','Svensson','1995-04-12',1,1),
('Anna','Lund','1992-11-02',2,1),
('Johan','Karlsson','1990-07-30',3,2),
('Lisa','Nilsson','1994-01-15',1,3),
('Mikael','Andersson','1988-09-05',4,2);
GO
-- 7) Link Soldiers to Weapons (must match real SoldierID and WeaponID)
INSERT INTO SoldierWeapon (SoldierID, WeaponID) VALUES
(1,1), (2,1), (2,2), (3,3), (4,1), (5,2);
GO
-- 8) Link Missions to Units
INSERT INTO MissionUnit (MissionID, UnitID) VALUES
(1,1), (1,2), (2,3);
GO