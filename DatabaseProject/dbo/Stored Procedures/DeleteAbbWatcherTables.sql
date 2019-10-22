-- =============================================
-- Author:		Renier Serven
-- Create date: 7/7/2018
-- Description:	Delete all record by XmlTables
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAbbWatcherTables] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM  [dbo].[XmlCatalogUnitAvailability] with (readpast)
    TRUNCATE TABLE [dbo].[XmlCatalogProduct] 
    DELETE FROM [dbo].[XmlCatalogProductFamily] with (readpast)
    DELETE FROM [dbo].[XmlCatalogSerie] with (readpast)
    DELETE FROM [dbo].[XmlCatalogUnit] with (readpast)
    DELETE FROM [dbo].[XmlCatalogManufacturer] with (readpast)
    DELETE FROM [dbo].[XmlCatalogFile] with (readpast)
END

