CREATE TABLE [dbo].[XmlCatalogSerie] (
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
    [XmlCatalogManufacturerId] UNIQUEIDENTIFIER NOT NULL,
    [SerId]                    NVARCHAR (300)   NOT NULL,
    [SerName]                  NVARCHAR (300)   NOT NULL,
    [StyId]                    NVARCHAR (300)   NOT NULL,
    [SerDayPerLens]            NVARCHAR (300)   NOT NULL,
    [SerWearFreq]              NVARCHAR (300)   NOT NULL,
    [DateCreated]              DATETIME         NOT NULL,
    [UserCreated]              NVARCHAR (50)    NOT NULL,
    [DateMaintained]           DATETIME         NOT NULL,
    [UserMaintained]           NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_XmlCatalogSerie] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_XmlCatalogSerie_XmlCatalogManufacturer] FOREIGN KEY ([XmlCatalogManufacturerId]) REFERENCES [dbo].[XmlCatalogManufacturer] ([Id])
);

