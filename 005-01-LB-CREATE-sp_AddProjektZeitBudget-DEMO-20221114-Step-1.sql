USE FirmaUebung;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE sp_AddProjektZeitBudget
	@ProjektID int,
	@Monat tinyint,
	@Jahr smallint,
	@Budget smallint,
	@Kommentar nvarchar(MAX),
	-----
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	
	-------------------------------	
	-- Hilfsvariablen deklarieren	
	DECLARE @CheckResult AS int;
	-------------------------------		
	BEGIN TRY
		-- @ProjektID existiert und ist nicht abgeschlossen
		SET @CheckResult = dbo.sf_ProjektAbgeschlossen(@ProjektID);
		IF @CheckResult IS NULL -- @ProjektID nicht gefunden, Fehler
			THROW 50001, 'Projekt existiert nicht, ProjektID ist falsch, bitte korrigieren!', 1;
			-- geht auch mit RAISEERROR			
			-- Help für THROW:
			-- https://docs.microsoft.com/de-de/sql/t-sql/language-elements/throw-transact-sql?view=sql-server-ver15


 
		-- TODO -- 
		-- Monat und Jahr - Zukunft
		-- INSERT INTO [dbo].[ProjektZeitBudget]
		SET @Erfolg = 1;
		SET @Feedback = 'Alles OK!';			
	END TRY 
	BEGIN CATCH
		SET @Erfolg = 0; -- nicht geklappt--
		-- 	@Feedback text OUTPUT --Fehlermeldungen etc.
		SET @Feedback = 
			ERROR_MESSAGE() 
			+ ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER())
			+ ' Prozedur: '  + ERROR_PROCEDURE()
			+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
	END CATCH; 
END
GO
