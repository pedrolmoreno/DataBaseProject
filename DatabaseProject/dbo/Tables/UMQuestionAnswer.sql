CREATE TABLE [dbo].[UMQuestionAnswer] (
    [QuestionAnswerId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [Question]         VARCHAR (150) NULL,
    [Answers]          VARCHAR (50)  NOT NULL,
    [Modified]         DATETIME      NULL,
    [ModifiedBy]       VARCHAR (50)  NULL,
    CONSTRAINT [PK_UmQuestionAnswer] PRIMARY KEY CLUSTERED ([QuestionAnswerId] ASC) WITH (FILLFACTOR = 90)
);

