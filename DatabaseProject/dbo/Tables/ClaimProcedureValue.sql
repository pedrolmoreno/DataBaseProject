CREATE TABLE [dbo].[ClaimProcedureValue] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [PageCode]      NVARCHAR (50)  NOT NULL,
    [Field]         NVARCHAR (50)  NULL,
    [Value]         NVARCHAR (50)  NULL,
    [ProcedureCode] NVARCHAR (MAX) NULL,
    [Active]        BIT            NULL,
    CONSTRAINT [PK_ProcedureClaimValue] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

