CREATE TABLE [dbo].[UMGenericLog] (
    [id]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [tablename] VARCHAR (50)    NULL,
    [action]    VARCHAR (20)    NULL,
    [primaryid] BIGINT          NULL,
    [oldvalue]  NVARCHAR (1000) NULL,
    [newvalue]  NVARCHAR (1000) NULL,
    [timestamp] DATETIME        CONSTRAINT [DF_UMGenericLog__timestamp] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_UMGenericLog_] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);

