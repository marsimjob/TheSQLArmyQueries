-- CRUD operations, Delete
USE ArmyOperationsDB
GO

-- Remove a mission
DELETE Mission
FROM Mission
WHERE MissionID = 3

SELECT
*
FROM Mission
GO

-- Remove all soldiers that are deseased
-- BUT FIRST we have to remove related rows in children tables
DELETE SoldierWeapon
FROM SoldierWeapon
JOIN Soldier AS s ON SoldierWeapon.SoldierID = s.SoldierID
WHERE s.Deseased = 1
GO

-- Then remove the soldier
DELETE FROM Soldier
WHERE Deseased = 1
GO

SELECT
*
FROM Soldier
ORDER BY SoldierID ASC
GO