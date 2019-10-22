CREATE TABLE [dbo].[XmlCatalogFile] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [XmlCatalogName] NVARCHAR (300)   NOT NULL,
    [DateCreated]    DATETIME         NOT NULL,
    [UserCreated]    NVARCHAR (50)    NOT NULL,
    [DateMaintained] DATETIME         NOT NULL,
    [UserMaintained] NVARCHAR (50)    NOT NULL,
    [IsValid]        BIT              CONSTRAINT [DF_XmlCatalogFile_IsValid] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_XmlCatalogFile] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

