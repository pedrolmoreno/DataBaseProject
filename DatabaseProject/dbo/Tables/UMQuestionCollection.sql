CREATE TABLE [dbo].[UMQuestionCollection] (
    [QuestionCollectionId] BIGINT       IDENTITY (1, 1) NOT NULL,
    [Description]          VARCHAR (50) NOT NULL,
    [Modified]             DATETIME     NULL,
    [ModifiedBy]           VARCHAR (50) NULL,
    CONSTRAINT [PK_UMQuestionCollection] PRIMARY KEY CLUSTERED ([QuestionCollectionId] ASC) WITH (FILLFACTOR = 90)
);

