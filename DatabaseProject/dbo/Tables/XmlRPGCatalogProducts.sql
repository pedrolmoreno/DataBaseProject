CREATE TABLE [dbo].[XmlRPGCatalogProducts] (
    [ProductId]    INT             IDENTITY (1, 1) NOT NULL,
    [Manufacturer] NVARCHAR (200)  NOT NULL,
    [FittingType]  NVARCHAR (200)  NOT NULL,
    [ProductName]  NVARCHAR (250)  NOT NULL,
    [UnitCost]     DECIMAL (18, 2) NOT NULL,
    [CptCode]      NVARCHAR (50)   NOT NULL,
    [Vcode]        NVARCHAR (10)   NOT NULL,
    CONSTRAINT [PK_XmlRPGCatalogProducts] PRIMARY KEY CLUSTERED ([ProductId] ASC) WITH (FILLFACTOR = 100)
);

