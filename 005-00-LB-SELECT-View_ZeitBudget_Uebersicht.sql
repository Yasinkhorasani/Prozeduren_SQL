/****** Skript für SelectTopNRows-Befehl aus SSMS ******/
SELECT TOP (1000) [Jahr]
      ,[Monat]
      ,[Projekt]
      ,[ProjektID]
      ,[Abgeschlossen]
      ,[Nachname]
      ,[Vorname]
      ,[Budget]
	  ,[Kommentar] 
  FROM [FirmaUebung].[dbo].[View_ZeitBudget_Uebersicht]
  WHERE Jahr >= 2022
  AND Monat >= 10
ORDER BY Jahr DESC, Monat DESC, Projekt;