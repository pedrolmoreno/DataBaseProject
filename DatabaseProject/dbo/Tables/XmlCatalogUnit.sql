CREATE TABLE [dbo].[XmlCatalogUnit] (
    [Id]                       UNIQUEIDENTIFIER NOT NULL,
    [XmlCatalogManufacturerId] UNIQUEIDENTIFIER NOT NULL,
    [UntId]                    NVARCHAR (300)   NOT NULL,
    [UntName]                  NVARCHAR (300)   NOT NULL,
    [UntLensQtty]              NVARCHAR (300)   NOT NULL,
    [UntPackQtty]              NVARCHAR (300)   NOT NULL,
    [UntPatientVisible]        BIT              NOT NULL,
    [DateCreated]              DATETIME         NOT NULL,
    [UserCreated]              NVARCHAR (50)    NOT NULL,
    [DateMaintained]           DATETIME         NOT NULL,
    [UserMaintained]           NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_XmlCatalogUnit] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_XmlCatalogUnit_XmlCatalogManufacturer] FOREIGN KEY ([XmlCatalogManufacturerId]) REFERENCES [dbo].[XmlCatalogManufacturer] ([Id])
);

