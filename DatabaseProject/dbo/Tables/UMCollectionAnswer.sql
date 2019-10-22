CREATE TABLE [dbo].[UMCollectionAnswer] (
    [UMQuestionCollectionId] BIGINT       NOT NULL,
    [UMQuestionAnswerId]     BIGINT       NOT NULL,
    [QuestionSequence]       INT          NOT NULL,
    [CollectionFormula]      VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_UMRelation_CollectionAnswer] PRIMARY KEY CLUSTERED ([UMQuestionCollectionId] ASC, [UMQuestionAnswerId] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_UMRelation_CollectionAnswer_UMQuestionAnswer] FOREIGN KEY ([UMQuestionAnswerId]) REFERENCES [dbo].[UMQuestionAnswer] ([QuestionAnswerId]),
    CONSTRAINT [FK_UMRelation_CollectionAnswer_UMQuestionCollection] FOREIGN KEY ([UMQuestionCollectionId]) REFERENCES [dbo].[UMQuestionCollection] ([QuestionCollectionId])
);

