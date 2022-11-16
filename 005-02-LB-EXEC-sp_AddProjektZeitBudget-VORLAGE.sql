USE FirmaUebung;
GO

DECLARE	@Erfolg bit; -- geklappt oder nicht
DECLARE	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.

/*
CREATE OR ALTER PROCEDURE sp_AddProjektZeitBudget
	@ProjektID int,
	@Monat tinyint,
	@Jahr smallint,
	@Budget smallint,
	@Kommentar nvarchar(MAX),
	-----
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
*/


--EXEC [dbo].[sp_AddProjektZeitBudget]
-- 	@Erfolg OUTPUT,
-- 	@Feedback OUTPUT;


SELECT @Erfolg AS 'Geklappt?', @Feedback AS 'Rückgabemeldung';