CREATE TABLE [dbo].[XmlCatalogProduct] (
    [Id]                        UNIQUEIDENTIFIER NOT NULL,
    [XmlCatalogProductFamilyId] UNIQUEIDENTIFIER NOT NULL,
    [PrdAddition]               NVARCHAR (300)   NOT NULL,
    [PrdAxis]                   NVARCHAR (300)   NOT NULL,
    [PrdCheckDigit]             NVARCHAR (300)   NOT NULL,
    [PrdColor]                  NVARCHAR (300)   NOT NULL,
    [PrdConvert]                NVARCHAR (300)   NOT NULL,
    [PrdCylinder]               NVARCHAR (300)   NOT NULL,
    [PrdDescription]            NVARCHAR (300)   NOT NULL,
    [PrdId]                     NVARCHAR (300)   NOT NULL,
    [PrdPower]                  NVARCHAR (300)   NOT NULL,
    [PrdUpcCode]                NVARCHAR (300)   NOT NULL,
    [PrdColorId]                NVARCHAR (300)   NOT NULL,
    [DateCreated]               DATETIME         NOT NULL,
    [UserCreated]               NVARCHAR (50)    NOT NULL,
    [DateMaintained]            DATETIME         NOT NULL,
    [UserMaintained]            NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_XmlCatalogProduct] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_XmlCatalogProduct_XmlCatalogProductFamily] FOREIGN KEY ([XmlCatalogProductFamilyId]) REFERENCES [dbo].[XmlCatalogProductFamily] ([Id])
);

