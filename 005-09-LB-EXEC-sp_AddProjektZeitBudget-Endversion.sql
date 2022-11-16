USE FirmaUebung;
GO

DECLARE	@Erfolg bit; -- geklappt oder nicht
-- Fehlermeldungen etc.
DECLARE	@Feedback VARCHAR(MAX); 


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

-- Test Monat und Jahr - Vergangenheit, März 2021
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50, --@ProjektID int -- Pappa Mia, nicht abgeschlossen 
--	3, --@Monat tinyint
--	2021, --@Jahr smallint
--	100, --@Budget smallint
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


-- Test Monat und Jahr -  Mai 2021
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50, --@ProjektID int -- Pappa Mia, nicht abgeschlossen 
--	5, --@Monat tinyint
--	2021, --@Jahr smallint
--	100, --@Budget smallint
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


 --Test Monat und Jahr -  Juli 2021
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50, --@ProjektID int -- Pappa Mia, nicht abgeschlossen 
--	7, --@Monat tinyint
--	2021, --@Jahr smallint
--	100, --@Budget smallint
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


-- Test INSERT --
EXEC [dbo].[sp_AddProjektZeitBudget] 
	60, --@ProjektID int -- Millenium Falcon, Han Solo, nicht abgeschlossen 
	11, --@Monat tinyint
	2022, --@Jahr smallint
	100, --@Budget smallint
	'Test sp_AddProjektZeitBudget',
	----------------------- 
	@Erfolg OUTPUT,
	@Feedback OUTPUT;
/*
Wenn wir 2 mal ausführen - Fehler:
Fehler Nr. 2601 Eine Zeile mit doppeltem Schlüssel 
kann in das dbo.ProjektZeitBudget-Objekt mit dem eindeutigen IX_Projekt_ZeitBudget-Index 
nicht eingefügt werden. 
Der doppelte Schlüsselwert ist (60, 2022, 11).
*/

-- Test Budget <= 0
-- Das ist ein Fehler
/*
Die INSERT-Anweisung steht in Konflikt 
mit der CHECK-Einschränkung "CK_ProjektZeitBudget_groesser_null". 
Der Konflikt trat in der FirmaUebung-Datenbank, Tabelle "dbo.ProjektZeitBudget", 
column 'Budget' auf. Fehler Nr. 547 Prozedur: dbo.sp_AddProjektZeitBudget Zeile Nr.: 39
*/
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50, --@ProjektID int -- Pappa mia, nicht abgeschlossen 
--	11, --@Monat tinyint
--	2022, --@Jahr smallint
--	-100, --@Budget smallint
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


SELECT @Erfolg AS 'Geklappt?', @Feedback AS 'Rückgabemeldung';