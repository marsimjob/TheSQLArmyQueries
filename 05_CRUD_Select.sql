-- CRUD Operations, read by SELECT
USE ArmyOperationsDB
GO

-- Show a complete table of all weapons
SELECT 
*
FROM Weapon
GO

-- Create a table that shows Units at specific locations
SELECT
*
FROM Unit
WHERE BaseLocation = 'Camp Delta'
OR BaseLocation = 'Poland'
ORDER BY UnitID ASC; -- Lowest ID first

-- Create a result that displays in order of full name characeter length
SELECT
SoldierID AS ID,
FirstName AS [Name],
LastName,
LEN(FirstName + LastName) AS FullName
FROM Soldier
ORDER BY FullName DESC; -- Highest char count first
GO