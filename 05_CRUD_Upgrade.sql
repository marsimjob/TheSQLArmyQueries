USE ArmyOperationsDB
GO

-- Update a name of a Unit in the Unit table
UPDATE Unit
SET UnitName = 'Sigma Company'
WHERE UnitName = 'Alpha Company';

SELECT
UnitName AS [NewName],
BaseLocation AS [Location]
FROM Unit
WHERE UnitId = 1
GO

-- Update viechle crew capacity
UPDATE Vehicle
SET CrewCapacity = 4
WHERE VehicleType = 'Jeep'; 

SELECT 
VehicleType AS [4-CompatibleVehicle],
CrewCapacity AS  [Seat(s)]
FROM  Vehicle
WHERE CrewCapacity = 4
GROUP BY VehicleType, CrewCapacity
ORDER BY VehicleType;
GO

-- Update soldier table to deseased
-- First
UPDATE Soldier
SET
Deseased = 1,
PassingDate = GETDATE()
WHERE FirstName = 'Elton'
AND LastName = 'Larsson';
--Second
UPDATE Soldier
SET
Deseased = 1,
PassingDate = GETDATE()
WHERE FirstName = 'Anna'
AND LastName = 'Lund';

SELECT
*
FROM Soldier
ORDER BY SoldierID ASC
GO