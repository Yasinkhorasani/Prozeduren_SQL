USE FirmaUebung;
GO

DECLARE	@Erfolg bit; -- geklappt oder nicht
DECLARE	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.


--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	@ProjektID int,
--	@Monat tinyint,
--	@Jahr smallint,
--	@Budget smallint,
--	@Kommentar nvarchar(MAX),
--	 TODO
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;

-- @ProjektID existiert und ist nicht abgeschlossen, OK
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	50, -- Pappa Mia, nicht abgeschlossen
--	8,
--	2022,
--	100,
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


---- @ProjektID existiert nicht
EXEC [dbo].[sp_AddProjektZeitBudget] 
	50000, -- ProjektID existiert nicht
	8, -- Monat
	2021, -- Jahr
	100, -- Budgee
	'Test sp_AddProjektZeitBudget', -- Kommentar
	----------------------- 
	@Erfolg OUTPUT,
	@Feedback OUTPUT;

	
-- @ProjektID existiert, ist abgeschlossen
--EXEC [dbo].[sp_AddProjektZeitBudget] 
--	130, --@ProjektID int -- Boney,Boney,Boney, ist abgeschlossen
--	1, --@Monat tinyint
--	2022, --@Jahr smallint
--	100, --@Budget smallint
--	'Test sp_AddProjektZeitBudget',
--	----------------------- 
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


SELECT @Erfolg AS 'Geklappt?', @Feedback AS 'Rückgabemeldung';