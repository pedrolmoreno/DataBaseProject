-- =============================================
-- Author:		Daniel
-- Create date: Nov, 22 2016
-- Description:	Get CapFalg
-- =============================================
CREATE PROCEDURE [dbo].[GetCapFlag] 
	-- Add the parameters for the stored procedure here
@LOB int,
@PROVIDER_ID int,
@LOCSVC_ID int,
@MEMBER_ID int,
@DOS DATETIME

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Local variables
	DECLARE @RC int
	DECLARE @REGION varchar(5)
	DECLARE @GRP int
	DECLARE @PLN int
	DECLARE @PLAN_ID int
	DECLARE @LOCSVC int
	DECLARE @PAYOR_ID int
	
    -- MemberInfo
	Select @GRP = GROUP_NBR, @PLAN_ID = PLAN_ID, @PAYOR_ID = PAYOR_ID from MemberInfo where id = @MEMBER_ID
	
	-- RBACK
	EXEC
	@RC= [TheSys].[dbo].[RBACK_PROVPAYOR]
	@LOB = @LOB OUTPUT,                            
	@PAYOR_ID = @PAYOR_ID OUTPUT,           
	@PROVIDER_ID = @PROVIDER_ID OUTPUT,    
	@REGION = '*',                          
	@GRP = @GRP,                               
	@PLN = @PLAN_ID OUTPUT,                 
	@LOCSVC = @LOCSVC_ID OUTPUT,                   
	@VDATE = @DOS OUTPUT                  
 
	-- Final Selection
	SELECT
	CAP_FLAG
	FROM PROV_PAYOR
	WHERE PAYOR_ID = @PAYOR_ID AND PROVIDER_ID = @PROVIDER_ID
	AND PLN_NBR = @PLAN_ID AND @DOS BETWEEN EFF_DATE AND EXP_DATE
	and LOB=@LOB and LOCSVC_ID=@LOCSVC_ID

END


