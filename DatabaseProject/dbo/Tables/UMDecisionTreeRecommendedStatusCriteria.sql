CREATE TABLE [dbo].[UMDecisionTreeRecommendedStatusCriteria] (
    [ID]                                BIGINT           IDENTITY (1, 1) NOT NULL,
    [ThesysPrecertId]                   INT              NULL,
    [ProcedureCode]                     VARCHAR (5)      NULL,
    [UmDecisionTreeId]                  BIGINT           NULL,
    [UmDecisionTreeFormulaResult]       BIT              NULL,
    [DecisionTreeRecommendedStatus]     VARCHAR (1)      NULL,
    [UmQuestionCollectionId]            BIGINT           NULL,
    [UmQuestionCollectionSequence]      INT              NULL,
    [UmQuestionCollectionFormulaResult] BIT              NULL,
    [UmQuestionAnswerId]                BIGINT           NULL,
    [UmQuestionAnswerSequence]          INT              NULL,
    [UmQuestionAnswerSelectedAnswer]    VARCHAR (50)     NULL,
    [CreationDate]                      DATETIME         NULL,
    [UserID]                            VARCHAR (50)     NULL,
    [RequestId]                         UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_UMDecisionTreeRecommendedStatusCriteria] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);

