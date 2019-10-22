CREATE TABLE [dbo].[XmlCatalogProductFamily] (
    [Id]                UNIQUEIDENTIFIER NOT NULL,
    [XmlCatalogSerieId] UNIQUEIDENTIFIER NOT NULL,
    [PrfConvert]        NVARCHAR (300)   NOT NULL,
    [PrfBaseCurve]      NVARCHAR (300)   NOT NULL,
    [PrfDiameter]       NVARCHAR (300)   NOT NULL,
    [PrfId]             NVARCHAR (300)   NOT NULL,
    [PrfRevDiagInd]     NVARCHAR (300)   NOT NULL,
    [DateCreated]       DATETIME         NOT NULL,
    [UserCreated]       NVARCHAR (50)    NOT NULL,
    [DateMaintained]    DATETIME         NOT NULL,
    [UserMaintained]    NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_XmlCatalogProductFamily] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_XmlCatalogProductFamily_XmlCatalogSerie] FOREIGN KEY ([XmlCatalogSerieId]) REFERENCES [dbo].[XmlCatalogSerie] ([Id])
);

