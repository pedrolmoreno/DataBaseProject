CREATE TABLE [dbo].[UMDecisionTree] (
    [DecisionTreeId] BIGINT       IDENTITY (1, 1) NOT NULL,
    [Description]    VARCHAR (50) NOT NULL,
    [WhenTrue]       VARCHAR (1)  NOT NULL,
    [WhenFalse]      VARCHAR (1)  NOT NULL,
    [LOB]            INT          NOT NULL,
    [PayorId]        INT          NOT NULL,
    [GroupType]      VARCHAR (5)  NOT NULL,
    [GroupId]        INT          NOT NULL,
    [PlanId]         INT          NOT NULL,
    [SpecialtyId]    INT          NOT NULL,
    [ProcedureCode]  VARCHAR (5)  NOT NULL,
    [EffectiveDate]  DATETIME     NOT NULL,
    [ExpirationDate] DATETIME     NOT NULL,
    [Modified]       DATETIME     NULL,
    [ModifiedBy]     VARCHAR (50) NULL,
    CONSTRAINT [PK_UMDecisionTree] PRIMARY KEY CLUSTERED ([DecisionTreeId] ASC) WITH (FILLFACTOR = 90)
);

