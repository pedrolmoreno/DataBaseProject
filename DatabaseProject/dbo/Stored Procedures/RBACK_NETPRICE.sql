﻿
CREATE PROCEDURE [dbo].[RBACK_NETPRICE]
	(
	@REGION  		VARCHAR(5) 	OUTPUT,
	@PAYOR 			INT 		OUTPUT,
	@SPECIALTY 		INT 		OUTPUT,
	@PROVIDER 		INT 		OUTPUT,
	@PROCCODE 		VARCHAR(5) 	OUTPUT,
	@MODIFIER 		VARCHAR(2) 	OUTPUT,
	@INNETWORK 		VARCHAR(1) 	OUTPUT,
	@PFSTYPE 		INT 		OUTPUT,
	@SFSTYPE 		INT 		OUTPUT,
	@TFSTYPE 		INT 		OUTPUT,
	@QFSTYPE 		INT 		OUTPUT,
	@FACILITY_IND 	VARCHAR(1)	OUTPUT,
	@VDATE 			DATETIME 	OUTPUT,
    @AGE            INT         OUTPUT
	)
AS

--***************************************
--***************************************
--********    CHANGE HISTORY
--***************************************
--***************************************
--DT 20050623 - ADD AGE RANGE TO KEYS
--              DROP CLIENT
--***************************************

/*	DEBUG STUFF
DECLARE
	@REGION  		VARCHAR(5),
	@PAYOR 			INT,
	@SPECIALTY 		INT,
	@PROVIDER 		INT,
	@PROCCODE 		VARCHAR(5),
	@MODIFIER 		VARCHAR(2),
	@INNETWORK 		VARCHAR(1),
	@PFSTYPE 		INT,
	@SFSTYPE 		INT,
	@TFSTYPE 		INT,
	@QFSTYPE 		INT,
	@FACILITY_IND 	VARCHAR(1),
	@VDATE 			DATETIME,
    @AGE            INT,
	@RSLT			INT

SELECT
	@REGION			='*',
	@PAYOR			=100,
	@SPECIALTY		=0,
	@PROVIDER		=0,
	@PROCCODE		='99213',
	@MODIFIER		='51',
	@INNETWORK		='I',
	@PFSTYPE 		=1,
	@SFSTYPE 		=2,
	@TFSTYPE 		=3,
	@QFSTYPE 		=4,
	@FACILITY_IND 	='N',
	@VDATE			='12/01/1999',
    @AGE            =25

SELECT 	@RSLT,
	@REGION,
	@PAYOR,
	@SPECIALTY,
	@PROVIDER,
	@PROCCODE,
	@MODIFIER,
	@INNETWORK,
	@PFSTYPE,
	@SFSTYPE,
	@TFSTYPE,
	@QFSTYPE,
	@FACILITY_IND,
	@VDATE,
    @AGE

EXEC @RSLT=RBACK_NETPRICE
	@REGION OUTPUT,
	@PAYOR OUTPUT,
	@SPECIALTY OUTPUT,
	@PROVIDER OUTPUT,
	@PROCCODE OUTPUT,
	@MODIFIER OUTPUT,
	@INNETWORK OUTPUT,
	@PFSTYPE OUTPUT,
	@SFSTYPE OUTPUT,
	@TFSTYPE OUTPUT,
	@QFSTYPE OUTPUT,
	@FACILITY_IND OUTPUT,
	@VDATE OUTPUT,
    @AGE OUTPUT

SELECT 	@RSLT,
	@REGION,
	@PAYOR,
	@SPECIALTY,
	@PROVIDER,
	@PROCCODE,
	@MODIFIER,
	@INNETWORK,
	@PFSTYPE,
	@SFSTYPE,
	@TFSTYPE,
	@QFSTYPE,
	@FACILITY_IND,
	@VDATE,
    @AGE
*/

DECLARE @L_REGION			VARCHAR(5)
DECLARE @L_PAYOR			INT
DECLARE @L_SPECIALTY		INT
DECLARE @L_PROVIDER			INT
DECLARE @L_PROCCODE 		VARCHAR(5)
DECLARE @L_MODIFIER 		VARCHAR(2)
DECLARE @FSTYPE 			INT
DECLARE @L_FSTYPE_PTR		INT
DECLARE @L_PFSTYPE 			INT
DECLARE @L_SFSTYPE 			INT
DECLARE @L_TFSTYPE 			INT
DECLARE @L_QFSTYPE 			INT
DECLARE @L_FACILITY_IND		VARCHAR(1)

DECLARE @R_REGION			VARCHAR(1)
DECLARE @R_PAYOR			VARCHAR(1)
DECLARE @R_SPECIALTY		VARCHAR(1)
DECLARE @R_PROVIDER			VARCHAR(1)
DECLARE @R_FSTYPE			VARCHAR(1)
DECLARE @R_PROCCODE			VARCHAR(1)
DECLARE @R_MODIFIER			VARCHAR(1)
DECLARE @R_FACILITY_IND		VARCHAR(1)

DECLARE @L_COUNTER			INT
DECLARE @SMSG               VARCHAR(4000)

SELECT @L_COUNTER 		= 1
SELECT @L_REGION		= @REGION
SELECT @L_PAYOR			= @PAYOR
SELECT @L_SPECIALTY		= @SPECIALTY
SELECT @L_PROVIDER		= @PROVIDER
SELECT @L_PROCCODE 		= @PROCCODE
SELECT @L_MODIFIER 		= @MODIFIER
SELECT @FSTYPE     		= @PFSTYPE
SELECT @L_PFSTYPE 		= @PFSTYPE
SELECT @L_SFSTYPE 		= @SFSTYPE
SELECT @L_TFSTYPE 		= @TFSTYPE
SELECT @L_QFSTYPE 		= @QFSTYPE
SELECT @L_FACILITY_IND 	= @FACILITY_IND

RBACK_DTL_LOOP:
IF EXISTS (SELECT 	PROG_ID
        	FROM 	RBACK_DTL
        	WHERE	PROG_ID = 2
        		AND LOB=0
        		AND SEQ=@L_COUNTER)
BEGIN
	SELECT 	@REGION			='*'
	SELECT 	@PAYOR			= 0
	SELECT 	@SPECIALTY		= 0
	SELECT 	@PROVIDER		= 0
	SELECT 	@FSTYPE			= 0
	SELECT 	@FACILITY_IND	='N'
	SELECT 	@PROCCODE		='*'
	SELECT 	@MODIFIER		='*'

    --PRINT 'GET DETAIL'

	SELECT 	@R_REGION 		=F1,
			@R_PAYOR		=F2,
			@R_SPECIALTY	=F3,
			@R_PROVIDER		=F4,
			@R_FSTYPE		=F5,
			@R_PROCCODE		=F6,
			@R_MODIFIER		=F7,
			@R_FACILITY_IND	=F8
	FROM 	RBACK_DTL 
	WHERE 	PROG_ID = 2
			AND LOB=0
			AND SEQ=@L_COUNTER

	IF @R_REGION		= 'Y' SELECT @REGION 		= @L_REGION
	IF @R_PAYOR			= 'Y' SELECT @PAYOR 		= @L_PAYOR		
	IF @R_SPECIALTY		= 'Y' SELECT @SPECIALTY		= @L_SPECIALTY
	IF @R_PROVIDER		= 'Y' SELECT @PROVIDER		= @L_PROVIDER
    --CHECK THE PRIMARY FS_TYPE FIRST
	IF @R_FSTYPE		= 'Y' SELECT @FSTYPE	    = @L_PFSTYPE
    SELECT @L_FSTYPE_PTR    = 1
	IF @R_PROCCODE		= 'Y' SELECT @PROCCODE		= @L_PROCCODE
	IF @R_MODIFIER		= 'Y' SELECT @MODIFIER		= @L_MODIFIER
	IF @R_FACILITY_IND	= 'Y' SELECT @FACILITY_IND	= @L_FACILITY_IND

FS_TYPE_LOOP:
    --SELECT @SMSG='SEQ '+CAST(@L_COUNTER AS VARCHAR(4))+' CLIENT '+@CLIENT+' REGION '+@REGION+' PAYOR '+CAST(@PAYOR AS VARCHAR(10))+' SPEC '+CAST(@SPECIALTY AS VARCHAR(4))+' PROV '+CAST(@PROVIDER AS VARCHAR(8))+' CPT '+@PROCCODE+' MOD '+@MODIFIER+' NET '+@INNETWORK+' FS_TYPE '+CAST(@FSTYPE AS VARCHAR(8))+' FAC_IND '+@FACILITY_IND+' DATE '+CONVERT(VARCHAR(10),@VDATE,111)
    --PRINT @SMSG
	IF EXISTS (SELECT 	REGION
        		FROM	NETPRICE
        		WHERE 	REGION 			    = @REGION
        				AND PAYOR_ID 		= @PAYOR
        				AND SPECIALTY 		= @SPECIALTY
        				AND PROVIDER_ID 	= @PROVIDER
        				AND CPT_CODE 		= @PROCCODE
        				AND CPT_MODIFIER 	= @MODIFIER
        				AND IN_NETWORK 		= @INNETWORK
        				AND FS_TYPE 		= @FSTYPE
        				AND FACILITY_IND	= @FACILITY_IND
        				AND @VDATE BETWEEN EFF_DATE AND EXP_DATE
        				AND @AGE BETWEEN AGE_FROM AND AGE_TO)
        BEGIN
        --SET THE PRIMARY FS TYPE TO THE MATCHED FS TYPE
        SELECT @PFSTYPE=@FSTYPE
		RETURN @L_COUNTER
        END  --IF EXISTS
	ELSE
        BEGIN
        SELECT @FSTYPE=0
        IF @L_FSTYPE_PTR<4
            BEGIN
            SELECT @L_FSTYPE_PTR=@L_FSTYPE_PTR+1
        	IF @R_FSTYPE = 'Y' 
                BEGIN
                SELECT @FSTYPE	= CASE @L_FSTYPE_PTR
                                    WHEN 2 THEN @L_SFSTYPE
                                    WHEN 3 THEN @L_TFSTYPE
                                    WHEN 4 THEN @L_QFSTYPE
                                    ELSE 0
                                  END
                --SELECT @SMSG='NEW FS PTR='+CAST(@L_FSTYPE_PTR AS VARCHAR(4))+' FS TYPE='+CAST(@FSTYPE AS VARCHAR(10))
                --PRINT @SMSG
                IF @FSTYPE>0 GOTO FS_TYPE_LOOP
                END  --@R_FSTYPE = 'Y'
            ELSE
                BEGIN
        		SELECT @L_COUNTER = @L_COUNTER + 1
                GOTO RBACK_DTL_LOOP
                END  --ELSE
            END  --@L_FSTYPE_PTR<4
        --DT 2003/06/16 - BUMP THE COUNTER (SEQ) ONCE ALL FS TYPES ARE EXHAUSTED
		SELECT @L_COUNTER = @L_COUNTER + 1
        GOTO RBACK_DTL_LOOP
        END  --ELSE
END
RETURN 0



