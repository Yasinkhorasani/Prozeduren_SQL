USE [FirmaUebung];
GO

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE OR ALTER VIEW [dbo].[View_ZeitBudget_Uebersicht]
AS
SELECT TOP (100) PERCENT dbo.ProjektZeitBudget.Jahr, dbo.ProjektZeitBudget.Monat, 
						 dbo.Projekt.Projekt, dbo.Projekt.ProjektID, dbo.Projekt.Abgeschlossen, 
						 dbo.Kunden.Nachname, dbo.Kunden.Vorname,
						 dbo.ProjektZeitBudget.Budget, dbo.ProjektZeitBudget.Kommentar 
FROM dbo.Projekt 
	INNER JOIN dbo.Kunden 
		ON dbo.Projekt.KundenID = dbo.Kunden.KundenID 
	LEFT OUTER JOIN dbo.ProjektZeitBudget 
		ON dbo.Projekt.ProjektID = dbo.ProjektZeitBudget.ProjektID
ORDER BY dbo.ProjektZeitBudget.Jahr DESC, dbo.ProjektZeitBudget.Monat DESC, Projekt;
GO


