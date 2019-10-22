
CREATE PROCEDURE [dbo].[GetChannelByUserID]
	-- Add the parameters for the stored procedure here
	 @id UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @idLocal UNIQUEIDENTIFIER

	set @idLocal = @id
    -- Insert statements for procedure here
	SELECT SUBSTRING(icr.Channels.LVL, 2, 5) AS lob, 
	       SUBSTRING(icr.Channels.LVL, 8, 5) AS ven, 
		   SUBSTRING(icr.Channels.LVL, 14, 5) AS loc, dbo.ChannelUsers.UserAccountId
	FROM   icr.Channels INNER JOIN
		   dbo.ChannelUsers ON icr.Channels.Id = dbo.ChannelUsers.ChannelId
	GROUP BY icr.Channels.LVL, dbo.ChannelUsers.UserAccountId
	HAVING  (dbo.ChannelUsers.UserAccountId = @idLocal)
	order by loc
END

