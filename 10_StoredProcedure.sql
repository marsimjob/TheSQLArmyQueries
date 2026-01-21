USE ArmyOperationsDB;
GO

-- Procedure that gives weapons to soldier
CREATE PROCEDURE GiveWeaponToSoldier
@SoldierID INT,
@WeaponID INT
AS
BEGIN
-- Does the soldier mot exist?
IF NOT EXISTS (SELECT 1 FROM Soldier WHERE SoldierID = @SoldierID)
BEGIN
PRINT 'Error! No soldier of that ID exists!';
RETURN;
END;

-- Does the weapon not exist?
IF NOT EXISTS (SELECT 1 FROM Weapon WHERE WeaponID = @WeaponID)
BEGIN
PRINT 'ERROR! Your weapon of choice cannot be found!';
RETURN;
END;

-- IF they exist already BUT they are already a match, return
IF EXISTS (
SELECT 1 
FROM SoldierWeapon 
WHERE
SoldierID = @SoldierID AND WeaponID = @WeaponID)
BEGIN
PRINT 'Soldier already has this very weapon!';
RETURN;
END;

--  Else create the column on the table
INSERT INTO SoldierWeapon (SoldierID, WeaponID)
VALUES (@SoldierID, @WeaponID);
PRINT 'Your soldier has recieve their weapon!';
END;
GO

--EXEC PROCEDURE
--EXEC GiveWeaponToSoldier
--@SoldierID = 4,
--@WeaponID = 1;
--GO

CREATE PROCEDURE AssignMissionToSoldier
@MissionName VARCHAR(100),
@StartDate DATE,
@EndDate DATE = NULL
AS
BEGIN
INSERT INTO Mission (MissionName, StartDate, EndDate)
VALUES (@MissionName, @StartDate, @EndDate);
END;
GO

--EXEC PROCEDURE
--EXEC AssignMissionToSoldier 
--@MissionName = 'Recon Patrol',
--@StartDate = '2026-01-15',
--@EndDate = '2026-01-20';
--GO