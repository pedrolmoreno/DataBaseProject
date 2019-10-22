CREATE TABLE [dbo].[UMTreeCollection] (
    [UMDecisionTreeId]       BIGINT       NOT NULL,
    [UMQuestionCollectionId] BIGINT       NOT NULL,
    [Sequence]               INT          NOT NULL,
    [Formula]                VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_UMRelation_TreeCollection] PRIMARY KEY CLUSTERED ([UMDecisionTreeId] ASC, [UMQuestionCollectionId] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_UMRelation_TreeCollection_UMDecisionTree] FOREIGN KEY ([UMDecisionTreeId]) REFERENCES [dbo].[UMDecisionTree] ([DecisionTreeId]),
    CONSTRAINT [FK_UMRelation_TreeCollection_UMQuestionCollection] FOREIGN KEY ([UMQuestionCollectionId]) REFERENCES [dbo].[UMQuestionCollection] ([QuestionCollectionId])
);

