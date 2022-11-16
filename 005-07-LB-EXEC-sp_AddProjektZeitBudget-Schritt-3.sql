USE FirmaUebung;
GO

DECLARE	@Erfolg bit; -- geklappt oder nicht
DECLARE	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.


--EXEC [dbo].[sp_AddProjektZeitBudget] 
	--@ProjektID int,
	--@Monat tinyint,
	--@Jahr smallint,
	--@Budget smallint,
	--@Kommentar nvarchar(MAX),
	-- TODO
	--@Erfolg OUTPUT,
	--@Feedback OUTPUT;

---- @ProjektID existiert und ist nicht abgeschlossen, OK
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50, -- Pappa Mia, nicht abgeschlossen
--	1,
--	2021,
--	100,
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


---- @ProjektID existiert nicht - OK
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50000, -- ProjektID existiert nicht
--	1,
--	2021,
--	100,
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;

	
-- @ProjektID existiert, ist abgeschlossen - OK
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	130, --@ProjektID int -- Teller waschen, ist abgeschlossen
--	1, --@Monat tinyint
--	2021, --@Jahr smallint
--	100, --@Budget smallint
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;

-- Test Monat und Jahr - Vergangenheit, Januar 2020
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50, --@ProjektID int -- Pappa Mia, nicht abgeschlossen 
--	1, --@Monat tinyint
--	2020, --@Jahr smallint
--	100, --@Budget smallint
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;

-- Test Monat und Jahr - Vergangenheit, Januar 2022
EXEC [dbo].[sp_AddProjektZeitBudget] 
	50, --@ProjektID int -- Pappa Mia, nicht abgeschlossen 
	1, --@Monat tinyint
	2022, --@Jahr smallint
	100, --@Budget smallint
	'Test sp_AddProjektZeitBudget',
	----------------------- 
	@Erfolg OUTPUT,
	@Feedback OUTPUT;

-- Jetzt
 --------- Test Monat und Jahr -  November 2022
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50, --@ProjektID int -- Pappa Mia, nicht abgeschlossen 
--	11, --@Monat tinyint
--	2022, --@Jahr smallint
--	100, --@Budget smallint
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


-- Test Monat und Jahr - Zukunft Dezember 2022
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50, --@ProjektID int -- Pappa Mia, nicht abgeschlossen 
--	12, --@Monat tinyint
--	2022, --@Jahr smallint
--	100, --@Budget smallint
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


-- Test Monat und Jahr - Zukunft Dezember 2025
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50, --@ProjektID int -- Pappa Mia, nicht abgeschlossen 
--	12, --@Monat tinyint
--	2025, --@Jahr smallint
--	100, --@Budget smallint
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


SELECT @Erfolg AS 'Geklappt?', @Feedback AS 'Rückgabemeldung';