CREATE TABLE [dbo].[UMQuestionAnswerLog] (
    [id]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [action]    VARCHAR (20)   NULL,
    [primaryid] BIGINT         NULL,
    [oldvalue]  NVARCHAR (200) NULL,
    [newvalue]  NVARCHAR (200) NULL,
    [timestamp] DATETIME       CONSTRAINT [DF_UMQuestionAnswerLog__timestamp] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_UMQuestionAnswerLog_] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);

