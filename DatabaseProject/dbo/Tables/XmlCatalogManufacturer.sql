CREATE TABLE [dbo].[XmlCatalogManufacturer] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [XmlCatalogFileId] UNIQUEIDENTIFIER NOT NULL,
    [ManId]            NVARCHAR (300)   NOT NULL,
    [ManName]          NVARCHAR (300)   NOT NULL,
    [DateCreated]      DATETIME         NOT NULL,
    [UserCreated]      NVARCHAR (50)    NOT NULL,
    [DateMaintained]   DATETIME         NOT NULL,
    [UserMaintained]   NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_XmlCatalogManufacturer] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_XmlCatalogManufacturer_XmlCatalogFile] FOREIGN KEY ([XmlCatalogFileId]) REFERENCES [dbo].[XmlCatalogFile] ([Id])
);

