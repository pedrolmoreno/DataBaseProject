

CREATE PROCEDURE [dbo].[GetUMAuthBySubscriberId]
	@subscriber_id	VARCHAR(50),
	@dependent_seq	INT,
	@LocationId	INT
AS
BEGIN
	
--
/******************************************************************************************************
-- UM AUTHORIZATION
*******************************************************************************************************/

SET NOCOUNT ON

/******************************************************************************************************
-- LOCAL VARIABLES
*******************************************************************************************************/

 
DECLARE @RETURN_TABLE TABLE(
	ID			INT,
	FIRST_NAME	VARCHAR(100),
	LAST_NAME	VARCHAR(100),
	AUTH_NO		VARCHAR(100),
	PROCESSDATE	DATETIME,
	DOB			DATETIME,
	AUTHEFFDATE	DATETIME)

--
/*****************************************************************************************************
--  GET DATA TO UM AUTHORIZATION
******************************************************************************************************/
INSERT INTO @RETURN_TABLE
SELECT 
	P.ID, PAT.FIRST_NAME, PAT.LAST_NAME, P.AUTH_NO, CONVERT(VARCHAR(10),P.CREATED_DATE,101) AS PROCESSDATE, 
	CONVERT(VARCHAR(10), PAT.DATE_OF_BIRTH,101) AS DOB ,CONVERT(VARCHAR(10), P.EFF_DATE,101) AS AUTHEFFDATE 
FROM 
	precert P INNER JOIN RPATACCT PAT ON P.ACCT_ID=PAT.ID
WHERE 
	PAT.SUBSCRIBER_ID=@subscriber_id
	AND PAT.DEPENDENT_SEQ=@dependent_seq
	AND P.LOCATION_ID=@LocationId


GOTO THEEXIT
 
SENDERROR:
GOTO THEEXIT

THEEXIT:
 
SELECT * FROM @RETURN_TABLE  
END




