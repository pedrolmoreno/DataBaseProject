CREATE PROCEDURE [dbo].[ClaimStatusReport](
	        @CLAIM_ID			INT)
		

AS


SET NOCOUNT ON


/******************************************************************************************************
-- LOCAL VARIABLES
--
*******************************************************************************************************/
declare @web_id			varchar(100)
declare @web_job_printed_file	varchar(130)
declare @LOCATION_NAME		VARCHAR(100)
declare @provider_id		int
declare @provider_name		varchar(100)
declare @TRD_DATE		DATETIME
declare	@MEMBER_THESYS_ID	INT
declare @MEMBER_NAME		varchar(100)
declare @SUB_ID			VARCHAR(100)
declare @AUTHNUM		VARCHAR(100)
declare @LENS_TYPE		VARCHAR(60)
declare @LENS_MATERIAL		varchar(100)
declare @FRAME_SOURCE		VARCHAR(100)
declare @JOB_PDF		VARCHAR(100)	
declare @tpx_loc_id		int
declare @thesys_loc_id		int
declare @dep_seq		int
declare @MEMBER_f_NAME		varchar(100)
declare @member_l_name		varchar(100)
declare @dos			datetime
declare @check_num		int
declare @cr_id			int
declare @check_date	        datetime
 

  
DECLARE @RETURN_TABLE TABLE(
		WEB_ID			varchar(100),
		CLAIM_ID		INT,
		LOCATION_NAME		VARCHAR(100),
		locsvc_id		int,
		provider_id		int,
		provider_name		varchar(100),
		TRD_DATE		DATETIME,
		dos			datetime,
		MEMBER_THESYS_ID	varchar (100),
		MEMBER_f_NAME		varchar(100),
		member_l_name		varchar(100),
		SUB_ID			VARCHAR(100),
		dep_seq			int,
		AUTHNUM			VARCHAR(100),	
		JOB_PDF			VARCHAR(100),
		check_num		int,
		cr_id			int,
		check_date		datetime)



--
/*****************************************************************************************************
--  
--
******************************************************************************************************/
set @TRD_DATE=null
set @web_id=null
select @MEMBER_THESYS_ID=hcfa_claim.pat_id,
	@LOCATION_NAME=locsvc.name, 
	@thesys_loc_id=hcfa_claim.locsvc_id,
	@AUTHNUM=hcfa_claim.prior_auth_number,
	@cr_id= max(check_run_id),
	@check_num= max(check_no),
	@web_id=batch_claim_id,
	--@dos=date_processed, -- Commented For Issue Id WP-84 --
	@dos=hcfa_claim.DOS, -- Added For Issue Id WP-84 --
	@TRD_DATE=j_trac.status_date,--wp_claim_report.datecreated,
	@provider_id=hcfa_claim.provider_id,
	@provider_name=provider.name,
	@web_job_printed_file=j_trac.web_job_printed_file,
	@check_date=Max(check_date)
	from hcfa_claim
	inner join locsvc on locsvc.id=hcfa_claim.locsvc_id
	left join clm_pmnt_dtl on clm_pmnt_dtl.claim_id=hcfa_claim.claim_id
	--inner  join wp_claim_report on wp_claim_report.web_id=@web_id  
	inner join provider on provider.id=hcfa_claim.provider_id
	left join j_trac on j_trac.job_id=@web_id and stat_id=1
	where hcfa_claim.claim_id=@CLAIM_ID
	group by hcfa_claim.pat_id, locsvc.name, hcfa_claim.locsvc_id, hcfa_claim.prior_auth_number, batch_claim_id, hcfa_claim.DOS, j_trac.status_date,
	hcfa_claim.provider_id,  provider.name, j_trac.web_job_printed_file

select @sub_id=subscriber_id,
       @dep_seq=dependent_seq ,
       @MEMBER_f_NAME=first_name,
       @member_l_name=last_name  
from rpatacct where id=@member_thesys_id and @dos between eff_date and exp_date

insert into @return_table values
	(@web_id,@claim_id,@LOCATION_NAME,@thesys_loc_id,@provider_id,@provider_name,@TRD_DATE,@dos,
@MEMBER_THESYS_ID,@MEMBER_f_NAME,@member_l_name,@sub_id,@dep_seq,@AUTHNUM,@web_job_printed_file,@check_num,
@cr_id,@check_date)


goto theexit

             
 
SENDERROR:
GOTO THEEXIT

THEEXIT:
 
SELECT * FROM @RETURN_TABLE  

