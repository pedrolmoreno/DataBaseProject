CREATE TABLE [dbo].[XmlCatalogUnitAvailability] (
    [Id]                        UNIQUEIDENTIFIER NOT NULL,
    [XmlCatalogProductFamilyId] UNIQUEIDENTIFIER NOT NULL,
    [UntId]                     NVARCHAR (300)   NOT NULL,
    [DateCreated]               DATETIME         NOT NULL,
    [UserCreated]               NVARCHAR (50)    NOT NULL,
    [DateMaintained]            DATETIME         NOT NULL,
    [UserMaintained]            NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_XmlCatalogUnitAvailability] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_XmlCatalogUnitAvailability_XmlCatalogProductFamily] FOREIGN KEY ([XmlCatalogProductFamilyId]) REFERENCES [dbo].[XmlCatalogProductFamily] ([Id])
);

