
CREATE PROCEDURE [dbo].[GetPaperJobStatus](
		@TRAN_TYPE			INT,
		@JOB_ID                         varchar(50))
		

AS


SET NOCOUNT ON


DECLARE  @ERR		INT
DECLARE  @RTN		INT
SET	 @ERR		=0
SET 	 @RTN		=0
 
DECLARE @RETURN_TABLE TABLE(
		TRAN_TYPE		INT,
		RESULT			INT,
		JOB_ID			varchar(50),
		STATUS_DATE		DATETIME,
		OFFICE_ID		INT,
		USR_name		varchar(40),
		STAT_ID			VARCHAR(3),
		COMMENT			VARCHAR(100),
		tray_id			int,
		MESSAGE			VARCHAR(60))		

--
/*****************************************************************************************************
-- VALIDATE REQUEST
--
******************************************************************************************************/
IF ISNULL(@TRAN_TYPE,0) <> 2
	BEGIN
		INSERT INTO @RETURN_TABLE SELECT @TRAN_TYPE,99,'','','','','','','','INVALID TRAN RECEIVED'
		GOTO SENDERROR
	END
	

--
/*****************************************************************************************************
-- NO VALID PROVIDER RECORD
--
******************************************************************************************************/
IF NOT EXISTS ( SELECT * 
			FROM  J_TRAC
			WHERE	JOB_ID=@JOB_ID)
	BEGIN
		INSERT INTO @RETURN_TABLE SELECT @TRAN_TYPE,0,'','','','','','','','JOB NOT FOUND'
		GOTO SENDERROR
	END

--
/*****************************************************************************************************
-- GET JOB STATUS
--
******************************************************************************************************/
IF EXISTS ( SELECT * 
			FROM  J_TRAC
			WHERE	JOB_ID=@JOB_ID)
	BEGIN
				INSERT INTO @RETURN_TABLE

                                    SELECT            @TRAN_TYPE,1,JOB_ID,STATUS_DATE,OFFICE_ID,j_user.usr_name,STAT_id,COMMENT,tray_id,'JOB FOUND'                              
	 
                                    FROM    J_TRAC JT
									left join j_user on j_user.usr_id=jt.usr_id
				    WHERE JOB_ID=@JOB_ID
                                   

                        GOTO SENDERROR

            END

SENDERROR:
GOTO THEEXIT

THEEXIT:
SELECT * FROM @RETURN_TABLE ORDER BY STATUS_DATE DESC

