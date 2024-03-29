﻿
CREATE PROCEDURE [dbo].[usp_GetPCPOrOPHProviderInformation] 
	@TRANS_TYPE	INT,
	@PAT_ID		INT,
	@LOCID		INT
AS
BEGIN
--- Local Declarations --
DECLARE @CURRENTDATE	DATETIME
DECLARE @PAYOR_ID		INT
DECLARE @HMOID			VARCHAR(20)
DECLARE @PCPPROVIDER_ID	VARCHAR(20)
DECLARE @PROVIDER_ID	INT
DECLARE @PROV_NAME		VARCHAR(100)
DECLARE @PROV_ADDRESS	VARCHAR(200)
DECLARE @PROV_CITY		VARCHAR(100)
DECLARE @PROV_STATE		VARCHAR(50)
DECLARE @PROV_ZIP		VARCHAR(20)
DECLARE @PROV_PHONE		VARCHAR(20)
DECLARE @PROV_FAX		VARCHAR(20)
DECLARE @NPI			VARCHAR(20)
DECLARE @TIN			VARCHAR(20)


SET @CurrentDate=CONVERT(VARCHAR(10),GETDATE(),101)

--- Local Declarations --
	--IF(@TRANS_TYPE=1)
	--BEGIN
		IF EXISTS (SELECT * FROM PAT_PCP WHERE PCP_TYPE='P3' AND PAT_ID=@PAT_ID AND @CURRENTDATE BETWEEN EFF_DATE AND EXP_DATE)
		BEGIN
			SELECT 
			    @PCPPROVIDER_ID=PID.VALUE, 
				@PROVIDER_ID=P.ID, 
				@PROV_NAME=NAME,
				@PROV_ADDRESS=STREET1, 
				@PROV_CITY=CITY, 
				@PROV_STATE=STATE,
				@PROV_ZIP=ZIP_CODE, 
				@PROV_PHONE=PHONE, 
				@PROV_FAX=FAX 
			FROM Provider P LEFT OUTER JOIN PAT_PCP PCP ON P.ID=PCP.PROVIDER_ID 
			     LEFT OUTER JOIN ProviderID PID ON PID.PROVIDER_ID=P.ID AND PID.CODE='BQ' 
			WHERE PAT_ID = @PAT_ID AND @CURRENTDATE BETWEEN PCP.EFF_DATE AND PCP.EXP_DATE
			
			SET @HMOID='0'
			SELECT 
			  @PAYOR_ID=PAYOR_ID 
			FROM RPATINS 
			WHERE ACCT_ID=@PAT_ID AND @CURRENTDATE BETWEEN EFF_DATE AND EXP_DATE 
			
			IF(@PAYOR_ID=6 OR @PAYOR_ID=10)
			BEGIN
				SELECT 
				 @HMOID=VALUE 
				FROM PROV_ID 
				WHERE PROVIDER_ID=@PROVIDER_ID AND CODE='BQ' AND (SUB_CODE='6' OR SUB_CODE='10')
			END
			ELSE
			BEGIN
				SELECT 
				 @HMOID=VALUE 
				FROM PROV_ID 
				WHERE PROVIDER_ID=@PROVIDER_ID AND CODE='BQ'
			END
			SET @NPI=(select top 1 Value from prov_id where code='XX' and provider_id = @PROVIDER_ID)
			SET @TIN=(select top 1 Value from LOCSVC_ID where code='ltid' and locsvc_id = @LOCID)
		
			--SELECT 
			--	'1' AS HMOID, 
			--	@PCPPROVIDER_ID AS PCPPROVIDER_ID, 
			--	@PROVIDER_ID AS PROVIDER_ID,
			--	@PROV_NAME AS PROV_NAME, 
			--	@PROV_ADDRESS AS PROV_ADDRESS, 
			--	@PROV_CITY AS PROV_CITY,
			--	@PROV_STATE AS PROV_STATE, 
			--	@PROV_ZIP AS PROV_ZIP, 
			--	@PROV_PHONE AS PROV_PHONE, 
			--	@PROV_FAX AS PROV_FAX, 
			--	@NPI AS NPI, 
			--	@TIN AS TIN 
				
				
			SELECT  
				@HMOID as HMOID,  
				PID.VALUE AS PCPPROVIDER_ID,  
				P.ID AS PROVIDER_ID, 
				P.NAME AS PROV_NAME, 
				P.STREET1 AS PROV_ADDRESS, 
				P.CITY AS PROV_CITY, 
				P.STATE AS PROV_STATE, 
				P.ZIP_CODE, 
				P.PHONE AS PROV_PHONE, 
				P.FAX AS PROV_FAX, 				   
				@NPI AS NPI, 
				@TIN AS TIN 
                FROM  PROVIDERS AS P LEFT OUTER JOIN
                    PROV_ID AS PID ON P.ID = PID.PROVIDER_ID AND PID.CODE = 'BQ' LEFT OUTER JOIN
                    PAT_PCP AS PCP ON P.ID = PCP.PROVIDER_ID  
				WHERE PAT_ID = @PAT_ID AND @CURRENTDATE BETWEEN PCP.EFF_DATE AND PCP.EXP_DATE

		END
	--END
	--IF(@TRANS_TYPE=2)
	--BEGIN
	--	IF EXISTS (SELECT * FROM PAT_PCP WHERE PCP_TYPE='OPH' AND PAT_ID=@PAT_ID AND @CURRENTDATE BETWEEN EFF_DATE AND EXP_DATE)
	--	BEGIN
	--		SELECT 
	--		@PROVIDER_ID=P.ID, 
	--		@PROV_NAME=NAME,@PROV_ADDRESS=STREET1, 
	--		@PROV_CITY=CITY, @PROV_STATE=STATE,
	--		@PROV_ZIP=ZIP_CODE, @PROV_PHONE=PHONE, @PROV_FAX=FAX 
	--		FROM Provider P LEFT OUTER JOIN PAT_PCP PCP ON P.ID=PCP.PROVIDER_ID 
	--		WHERE PCP.PCP_TYPE='OPH' AND PAT_ID = @PAT_ID AND @CURRENTDATE BETWEEN PCP.EFF_DATE AND PCP.EXP_DATE
			
	--		SELECT 
	--			@PROVIDER_ID AS PROVIDER_ID,
	--			@PROV_NAME AS PROV_NAME, @PROV_ADDRESS AS PROV_ADDRESS, @PROV_CITY AS PROV_CITY,
	--			@PROV_STATE AS PROV_STATE, @PROV_ZIP AS PROV_ZIP, @PROV_PHONE AS PROV_PHONE, @PROV_FAX AS PROV_FAX   
	--	END
	--END
END




