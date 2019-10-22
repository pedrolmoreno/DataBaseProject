-- =============================================
-- Author:		Daniel
-- Create date: Nov, 22 2016
-- Description:	get request indicator for UM
-- =============================================
CREATE PROCEDURE [dbo].[GetRequestIndicator] 
	-- Add the parameters for the stored procedure here
	@DOS DATETIME,
	@LOB INT, 
	@PROVIDER_NBR INT, 
	@LOCSVC     INT,
	@SPECIALTY  INT,
	@CODEVALUE VARCHAR(6),
	@MEMBER_ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Local variables
	DECLARE @RC int
	DECLARE @CODETYPE INT = 4
	DECLARE @PAYOR INT
	DECLARE @NETWORK_FLAG CHAR(1)  = '*'
	DECLARE @REGION VARCHAR(5) = '*'
	DECLARE @GROUP_NBR INT
	DECLARE @PLAN_NBR  INT
	DECLARE @BENLVL INT = 0
	DECLARE @POS VARCHAR(2) = '11'
	DECLARE @REQIND VARCHAR(1)
	DECLARE @UNITTYPE INT = 0 
	DECLARE @TRACKUNITS VARCHAR(1) = '0'

	-- MemberInfo
	Select @GROUP_NBR = GROUP_NBR, @PLAN_NBR = PLAN_ID, @PAYOR = PAYOR_ID from MemberInfo where id = @MEMBER_ID

    -- RBACK
	EXEC
	@RC = [Thesys].[dbo].[RBACK_UM_AUTH_SVCTYPE]
	@DOS = @DOS,
	@CODETYPE = @CODETYPE,
	@CODEVALUE = @CODEVALUE ,
	@LOB = @LOB OUTPUT,
	@PAYOR = @PAYOR  OUTPUT, 
	@NETWORK_FLAG = @NETWORK_FLAG OUTPUT,
	@REGION  = @REGION OUTPUT,
	@GROUP_NBR = @GROUP_NBR OUTPUT, 
	@PLAN_NBR  = @PLAN_NBR  OUTPUT,
	@PROVIDER_NBR = @PROVIDER_NBR OUTPUT,
	@LOCSVC = @LOCSVC OUTPUT, 
	@BENLVL = @BENLVL OUTPUT, 
	@POS = @POS OUTPUT,
	@SPECIALTY = @SPECIALTY OUTPUT,
	@REQIND =  @REQIND OUTPUT, -- Output (Y or N)
	@UNITTYPE = @UNITTYPE OUTPUT, 
	@TRACKUNITS = @TRACKUNITS OUTPUT  

	-- select value
	Select @REQIND AS REQIND

END


