USE ArmyOperationsDB
GO

-- VIEW practice 
-- Create a temporary table tah tholds Soldiers and their rank
CREATE VIEW ViewSoldierWithRank AS
SELECT 
s.SoldierID,
s.FirstName + ' ' + s.LastName AS FullName,
r.RankName
FROM Soldier s
JOIN [Rank] r ON s.RankID = r.RankID;
GO

--SELECT * FROM ViewSoldierWithRank;
--GO

-- Make a tamporary table with Soldiers and their mission assignments
CREATE VIEW ViewMissionUnitAssignments AS
SELECT 
m.MissionID,
m.MissionName,
u.UnitName,
m.StartDate,
m.EndDate
FROM Mission m
JOIN MissionUnit mu ON m.MissionID = mu.MissionID
JOIN Unit u ON mu.UnitID = u.UnitID;
GO

--SELECT*
--FROM ViewMissionUnitAssignments
--GO