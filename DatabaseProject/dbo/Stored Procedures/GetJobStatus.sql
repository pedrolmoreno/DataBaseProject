
CREATE Procedure [dbo].[GetJobStatus](
		@TRAN_TYPE			INT,
		@TpxID				Varchar(10),
		@JOB_ID             varchar(25),
		@CLAIM_ID			INT,
		@auth_no			varchar(25),
		@SEARCH_METHOD		INT,
		@VendorId			INT)
		

AS

SET NOCOUNT ON

--
/******************************************************************************************************
-- LOCAL VARIABLES
--
*******************************************************************************************************/
 
declare @web_job_printed_file	varchar(130)
declare @CLAIM_ID2		INT
declare @LOCATION_NAME		VARCHAR(100)
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
declare @sub_id2		varchar(200)
declare @web_id			varchar(25)
declare @dos			datetime
DECLARE  @ERR		INT
DECLARE  @RTN		INT
declare @fname			varchar(150)
Declare @JobIdLocal  varchar(35)

set @authnum=null

SET	 @ERR =0
SET  @RTN =0
 
DECLARE @RETURN_TABLE TABLE(
		WEB_ID			varchar(50),
		CLAIM_ID		INT,
		LOCATION_NAME		VARCHAR(100),
		TRD_DATE		DATETIME,
		dos			datetime,
		MEMBER_THESYS_ID	varchar (100),
		MEMBER_f_NAME		varchar(100),
		member_l_name		varchar(100),
		SUB_ID			VARCHAR(100),
		dep_seq			int,
		AUTHNUM			VARCHAR(100),
		LENS_TYPE		VARCHAR(60),
		LENS_MATERIAL		varchar(100),
		FRAME_SOURCE		VARCHAR(100),
		fname			varchar(150),
		JOB_PDF			VARCHAR(100))		


--******************************************************************************************************
IF @SEARCH_METHOD=0 --search by job #
begin

set @JobIdLocal = @TpxID + '-' + @Job_id
select  @tpx_loc_id=office_id,
	@job_pdf=web_job_printed_file,
	@web_job_printed_file=web_job_printed_file  
from j_trac where job_id=@JobIdLocal


select @thesys_loc_id=locsvc_id.locsvc_id from locsvc_id where code='tpx' and value=@tpx_loc_id

select @location_name=locsvc.name 
from locsvc where locsvc.id=@thesys_loc_id 
 
select @trd_date=datecreated, 
	@member_thesys_id=patid ,
	@authnum=authnbr,
	@lens_type=lens_type,
	@lens_material=materials,
	@frame_source=framesource,@fname=fname,
	@dos=dos   
from wp_claim_report where web_id=@job_id

select @claim_id=claim_id from hcfa_claim where @job_id=batch_claim_id and Vendor_Id = @VendorId

select @sub_id=subscriber_id,
       @dep_seq=dependent_seq ,
       @MEMBER_f_NAME=first_name,
       @member_l_name=last_name  
from rpatacct where id=@member_thesys_id and @dos between eff_date and exp_date

if isnull(@Claim_id,0) <> 0
	INSERT INTO @RETURN_TABLE values 
	(@JOB_ID,@claim_id,@location_name,@trd_date,@dos,@member_thesys_id,
	@member_f_name,@member_l_name,@sub_id,@dep_seq,@authnum,
	@lens_type,@lens_material,@frame_source,@fname,@web_job_printed_file)

goto theexit

END

IF @SEARCH_METHOD=1  --search by claim #
BEGIN
	select @job_id=batch_claim_id from hcfa_claim where @claim_id=claim_id and Vendor_Id = @VendorId

	set @JobIdLocal = @TpxId + '-' + @Job_id
	
	select  @tpx_loc_id=office_id,
	@job_pdf=web_job_printed_file,
	@web_job_printed_file=web_job_printed_file  
	from j_trac where job_id=@JobIdLocal 

	select @thesys_loc_id=locsvc_id.locsvc_id from locsvc_id where code='tpx' and value=@tpx_loc_id

	select @location_name=locsvc.name 
	from locsvc where locsvc.id=@thesys_loc_id 

 
	select @trd_date=datecreated, 
	@member_thesys_id=patid ,
	@authnum=authnbr,
	@lens_type=lens_type,
	@lens_material=materials,
	@frame_source=framesource,@fname=fname,
	@dos=dos   
	from wp_claim_report where web_id=@job_id

	select @sub_id=subscriber_id,
    @dep_seq=dependent_seq ,
    @MEMBER_f_NAME=first_name,
    @member_l_name=last_name  
	from rpatacct where id=@member_thesys_id and @dos between eff_date and exp_date

	if @fname is not null
	INSERT INTO @RETURN_TABLE values 
	(@JOB_ID,@claim_id,@location_name,@trd_date,@dos,@member_thesys_id,
	@member_f_name,@member_l_name,@sub_id,@dep_seq,@authnum,
	@lens_type,@lens_material,@frame_source,@fname,@web_job_printed_file)

	goto theexit

END

IF @SEARCH_METHOD=2  --search by auth_no # discontinued
	begin
select @trd_date=datecreated, 
	@member_thesys_id=patid ,
	@authnum=authnbr,
	@lens_type=lens_type,
	@lens_material=materials,
	@frame_source=framesource,@fname=fname,
	@dos=dos,@web_id=web_id   
from wp_claim_report where authnbr=@auth_no

select @sub_id=subscriber_id,
       @dep_seq=dependent_seq ,
       @MEMBER_f_NAME=first_name,
       @member_l_name=last_name  
from rpatacct where id=@member_thesys_id and getdate() between eff_date and exp_date


select  @tpx_loc_id=office_id,
	@job_pdf=web_job_printed_file,
	@web_job_printed_file=web_job_printed_file  
from j_trac where job_id=@web_id  


select @thesys_loc_id=locsvc_id.locsvc_id from locsvc_id where code='tpx' and value=@tpx_loc_id

select @location_name=locsvc.name 
from locsvc where locsvc.id=@thesys_loc_id

if @fname is not null
INSERT INTO @RETURN_TABLE values 
(@web_ID,@claim_id,@location_name,@trd_date,@dos,@member_thesys_id,
@member_f_name,@member_l_name,@sub_id,@dep_seq,@authnum,
@lens_type,@lens_material,@frame_source,@fname,@web_job_printed_file)

goto theexit

end
SENDERROR:
GOTO THEEXIT

THEEXIT:
 
SELECT * FROM @RETURN_TABLE  


