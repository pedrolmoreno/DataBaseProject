
CREATE PROCEDURE [dbo].[GetJobStatusDetail](
		@TRAN_TYPE			INT,
		@ClaimId			INT,
		@JOB_ID            varchar(25))
AS


SET NOCOUNT ON

--
/******************************************************************************************************
-- LOCAL VARIABLES
--
*******************************************************************************************************/
declare @location	int
DECLARE  @ERR		INT
DECLARE  @RTN		INT
SET	 @ERR		=0
SET 	 @RTN		=0
 
 Declare @ClaimId_loc int
 Declare @JOB_ID_Loc varchar(25)

 set @ClaimId_loc = @ClaimId
 set @JOB_ID_Loc = @Job_ID

DECLARE @RETURN_TABLE TABLE(
		TRAN_TYPE		INT,
		RESULT			INT,
		JOB_ID			varchar(25),
		STATUS_DATE		DATETIME,
		OFFICE_ID		INT,
		USR_name		varchar(40),
		STAT 			VARCHAR(150),
		COMMENT			VARCHAR(100),
		MESSAGE			VARCHAR(60))		


-- VALIDATE REQUEST

IF ISNULL(@TRAN_TYPE,0) <> 2
	BEGIN
		INSERT INTO @RETURN_TABLE SELECT @TRAN_TYPE,99,'','','','','','','Invalid Transaction'
		GOTO SENDERROR
	END

--
/*****************************************************************************************************
--  
--
******************************************************************************************************/

if (isnull(@ClaimId_Loc,0)> 0)
	select @job_id=batch_claim_id from hcfa_claim where @ClaimId_Loc=claim_id

IF NOT EXISTS ( SELECT top 1 office_id
			FROM  J_TRAC
			WHERE	job_id = @job_id_loc )
	BEGIN
	print @job_id_loc
		INSERT INTO @RETURN_TABLE SELECT @TRAN_TYPE,0,'','','','','','','JOB NOT FOUND'
		GOTO SENDERROR
	END
--
/*****************************************************************************************************
-- 
--
******************************************************************************************************/

	SELECT @location=office_id
	FROM  J_TRAC
	WHERE	job_id = @job_id_Loc
	
	print @location
			
	INSERT INTO @RETURN_TABLE
    SELECT  @TRAN_TYPE,1,JOB_ID,STATUS_DATE,OFFICE_ID,j_user.usr_name,STAT_name,COMMENT,'JOB FOUND'                              
    FROM    J_TRAC JT
	left join j_user on j_user.usr_id=jt.usr_id
	inner join j_stat_code on j_stat_code.stat_id = jt.stat_id
	WHERE job_id = @job_id_Loc or job_id=cast (@location as varchar)+ '-' + cast (@job_id as varchar)
                                   

    GOTO SENDERROR

SENDERROR:
GOTO THEEXIT

THEEXIT:

update @return_table set usr_name='PROVIDER OFFICE' --, STAT='TRANSMITTED TO LAB'
where usr_name is null 
SELECT * FROM @RETURN_TABLE ORDER BY STATUS_DATE DESC
