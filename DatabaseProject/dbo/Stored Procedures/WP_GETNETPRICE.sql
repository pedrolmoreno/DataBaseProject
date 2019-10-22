﻿

CREATE PROCEDURE [dbo].[WP_GETNETPRICE]
	(
		@PROVIDER_ID	INT,
		@PAT_ID			INT,
		@PROC_CODE		VARCHAR(7),
		@ALLOWED		MONEY OUTPUT,
		@LOCSVC			INT
	)
	
AS

SET NOCOUNT ON

DECLARE @PAYOR_ID		INT
DECLARE @PLAN_ID		INT
DECLARE @PFSTYPE		INT
DECLARE @SFSTYPE		INT
DECLARE @TFSTYPE		INT
DECLARE @QFSTYPE		INT
DECLARE @return_value	INT
DECLARE @GROUPNBR		INT
DECLARE @INNETWORK		CHAR(1)
DECLARE @SPECIALTY		int
DECLARE @FACILITY_IND	CHAr(1)
DECLARE @VDATE			DATETIME
DECLARE @LOB			INT



SELECT @VDATE = GETDATE()

--GET PAT info
--------------------------------------------------------
SELECT 
	@PAYOR_ID = INS.PAYOR_ID, @PLAN_ID = PH.PLAN_ID, @GROUPNBR = PH.GROUP_NBR
FROM 
	RPATINS INS
JOIN PLNHIST PH
ON
INS.ACCT_ID = PH.PAT_ID
AND
	GETDATE() BETWEEN PH.EFF_DATE AND PH.EXP_DATE
WHERE 
	INS.ACCT_ID = @PAT_ID
AND
	INS.PAYOR_IND = 'P'
AND 
	GETDATE() BETWEEN INS.EFF_DATE AND INS.EXP_DATE

--GET LOB FROM Group table
SELECT @LOB = LOB from GRP WHERE GROUP_NBR = @GROUPNBR and GETDATE() BETWEEN EFF_DATE and EXP_DATE

-- GET THE CORRECT PROV PAY RECORD!
---------------------------------------------------
EXEC	@return_value = [dbo].[RBACK_PROVPAYOR]
		@LOB = @LOB OUTPUT,
		@PAYOR_ID = @PAYOR_ID OUTPUT,
		@PROVIDER_ID = @PROVIDER_ID OUTPUT,
		@REGION = '*',
		@GRP = @GROUPNBR,
		@PLN = @PLAN_ID OUTPUT,
		@LOCSVC = @LOCSVC,
		@VDATE = @VDATE OUTPUT

-- NOW GET THE DATA FROM PROV PAY!
--------------------------------------------
SELECT 
	@PFSTYPE = PRI_FS_TYPE,
	@SFSTYPE = SEC_FS_TYPE,
	@TFSTYPE = TERT_FS_TYPE,
	@QFSTYPE = QUAD_FS_TYPE,
	@INNETWORK = NETWORK_FLAG,
	@SPECIALTY = SPECIALTY
FROM 
	PROV_PAYOR
WHERE
	PROVIDER_ID = @PROVIDER_ID
AND
	PAYOR_ID = @PAYOR_ID
AND 
	PLN_NBR = @PLAN_ID

--Call Rollback for NETPRICE
----------------------------------------------------
EXEC	@return_value = [dbo].[RBACK_NETPRICE]
		@REGION = '*' ,
		@PAYOR = @PAYOR_ID OUTPUT,
		@SPECIALTY = @SPECIALTY OUTPUT,
		@PROVIDER = @PROVIDER_ID OUTPUT,
		@PROCCODE = @PROC_CODE OUTPUT,
		@MODIFIER = '*' ,
		@INNETWORK = @INNETWORK OUTPUT,
		@PFSTYPE = @PFSTYPE OUTPUT,
		@SFSTYPE = @SFSTYPE OUTPUT,
		@TFSTYPE = @TFSTYPE OUTPUT,
		@QFSTYPE = @QFSTYPE OUTPUT,
		@FACILITY_IND = null,
		@VDATE = @VDATE,
		@AGE = 0

--Grab Correct allowed amount
-----------------------------------------
SELECT 
	@ALLOWED = PRICE
FROM NETPRICE 
WHERE 
	CPT_CODE = @PROC_CODE
AND
	FS_TYPE = @PFSTYPE
and 
	GETDATE() BETWEEN EFF_DATE AND EXP_DATE
RETURN @ALLOWED
