CREATE TABLE [dbo].[COAAdvisoryMessage] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [EffectiveDate]  DATETIME2 (7)   NOT NULL,
    [ExpirationDate] DATETIME2 (7)   NOT NULL,
    [Message]        NVARCHAR (2500) NULL,
    [CreatedDate]    DATETIME2 (7)   DEFAULT ('0001-01-01T00:00:00.0000000') NOT NULL,
    CONSTRAINT [PK_COAAdvisoryMessage] PRIMARY KEY CLUSTERED ([Id] ASC)
);

