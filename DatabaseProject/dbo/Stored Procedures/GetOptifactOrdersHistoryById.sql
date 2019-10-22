-- =============================================
-- Author:		<Rogelio Romero>
-- Create date: <07/16/2018>
-- Description:	<Get Optifact order status history>
-- =============================================
CREATE PROCEDURE [dbo].[GetOptifactOrdersHistoryById](
	        @InvoiceNumber			INT)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   
SELECT  distinct los.ID, los.AccountNumber, los.datein, los.patientname, invoicenumber, materialCode, traynumber, status, date, los.time, hc.CLAIM_ID ClaimId, rp.FIRST_NAME + ' ' + rp.LAST_NAME MemberName, 
pr.NAME ProviderName, rp.SUBSCRIBER_ID SubscriberId, rp.DEPENDENT_SEQ DependentSequence, ls.value LocationTPX
  FROM [PIC].[dbo].[LensOrderStatus] los
  inner join wpclaimreport wcr on los.invoiceNumber = wcr.web_id
  inner join locsvc_id ls on wcr.locid = ls.locsvc_id
  inner join provider pr on wcr.provid = pr.id
  inner join rpatacct rp on wcr.patid = rp.id
  left join hcfa_claim hc on los.invoicenumber = hc.batch_claim_id
  where wcr.DOS > RP.EFF_DATE and wcr.DOS <= RP.EXP_DATE
  and ls.code ='TPX' 
 and Invoicenumber = @InvoiceNumber
 order by date , time 
END

