-- JOIN QUERY understanding
USE ArmyOperationsDB
GO

-- Create a JOIN table that Displays infromation about a mission and its personell
SELECT
m.MissionName AS Mission,
COUNT(s.SoldierID) AS Soldiers,
u.UnitName AS Unit
FROM MissionUnit
INNER JOIN Mission AS m ON MissionUnit.MissionID = m.MissionID
INNER JOIN Unit AS u ON MissionUnit.UnitID = u.UnitID
INNER JOIN Soldier AS s ON u.UnitID = s.UnitID
WHERE m.MissionID = 2 -- I just want information from mission 2
GROUP BY m.MissionName, u.UnitName;
GO

-- Select how many sodliers in a Unit (HAVING more than 3)
SELECT
u.UnitName,
COUNT(s.SoldierID) AS SoldierCount
FROM Soldier s
INNER JOIN Unit u ON s.UnitID = u.UnitID
GROUP BY u.UnitName
HAVING COUNT(s.SoldierID) > 3
GO

-- Select from missions what soldiers are participating full name sand their weapons, including Null
SELECT DISTINCT
s.FirstName + ' ' + s.LastName AS SoldierFullName,
ISNULL(w.WeaponType, 'No Weapon') AS Weapon, -- Cool way of replacing NULL columns with 'No Weapon'
m.MissionName AS Mission
FROM MissionUnit mu
INNER JOIN Mission AS m ON mu.MissionID = m.MissionID
INNER JOIN Unit AS u ON mu.UnitID = u.UnitID
INNER JOIN Soldier AS s ON u.UnitID = s.UnitID
LEFT JOIN SoldierWeapon AS sw ON sw.SoldierID = s.SoldierID
LEFT JOIN Weapon AS w ON sw.WeaponID = w.WeaponID
GO

-- How many weapons each soldier carry with a common table expression aka temporary tabel
WITH WeaponCount AS 
(
SELECT 
sw.SoldierID,
COUNT(sw.WeaponID) AS NumberOfWeapons -- counting my weapons
FROM SoldierWeapon sw
GROUP BY sw.SoldierID -- Count per SoldierID (how many weapons does each soldier have
)
SELECT 
s.SoldierID,
s.FirstName + ' ' + s.LastName AS FullName,
COALESCE(wc.NumberOfWeapons, 0) AS NumberOfWeapons -- COALESCE for 0 instead of NULL (it returns the first value that isn't null)
FROM Soldier s
LEFT JOIN WeaponCount wc ON s.SoldierID = wc.SoldierID;
GO

-- Shows how many times a weapon has been used for a mission (its a huge join, I used ChatGPT for this)
-- First calculate usage of each weapon on a per mission basisis (3 shotguns on mission 1, 2 handguns on mission 1 etc)
-- A Common Table Expression for WeaponUsage
WITH WeaponUsage AS (
SELECT
m.MissionID,
m.MissionName,
w.WeaponID,
w.WeaponType,
COUNT(*) AS UsageCount -- Counts entires with same values (this will be used for weapons later)
FROM MissionUnit mu
JOIN Unit u ON mu.UnitID = u.UnitID
JOIN Soldier s ON u.UnitID = s.UnitID
JOIN SoldierWeapon sw ON s.SoldierID = sw.SoldierID
JOIN Weapon w ON sw.WeaponID = w.WeaponID
JOIN Mission m ON mu.MissionID = m.MissionID
GROUP BY  m.MissionID, m.MissionName, w.WeaponID, w.WeaponType
),
-- Here we rank the results with ROW OVER, each mission order by most used...
RankedUsage AS (
SELECT
wu.*, -- Get all from Weapon Usage CTE that I created above
ROW_NUMBER() OVER (
PARTITION BY wu.MissionID -- Divide count over each mission, What Mission?
ORDER BY wu.UsageCount DESC)-- Order them most-to-least, most of the same weapon on top!
AS RankNr -- This makes it possible to get the top pick weapon from the list
FROM WeaponUsage wu
)
SELECT 
MissionID,
MissionName,
WeaponID,
WeaponType,
UsageCount
FROM RankedUsage
WHERE RankNr = 1 -- Return entry on row number 1 (the weapon that has been used most on the mission)
ORDER BY MissionID;
GO