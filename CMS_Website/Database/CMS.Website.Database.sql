USE [CMS.Website.Database]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Achievement]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_Achievement]
    @AchievementId INT,
	@UserId INT
	
AS
BEGIN
	UPDATE Achievement
	SET Status=0,
	UserId = @UserId
	WHERE AchievementId= @AchievementId
    
END


GO
/****** Object:  StoredProcedure [dbo].[Delete_Event]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_Event]
	@EventId INT,
	@UserId INT
AS
BEGIN
    UPDATE Event
	SET Status=0,
	UserId = @UserId
	WHERE EventId=@EventId

END


GO
/****** Object:  StoredProcedure [dbo].[Delete_News]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_News]
    @NewsId INT,
	@UserId INT
	
   
AS
BEGIN
	UPDATE News
	SET Status=0,
	UserId = @UserId
    WHERE NewsId = @NewsId
	
    
END


GO
/****** Object:  StoredProcedure [dbo].[Delete_PhotoGallery]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_PhotoGallery]
    @PhotoId INT,
	@UserId INT
	
   
AS
BEGIN
	UPDATE PhotoGallery
	SET Status=0,
	UserId = @UserId
    WHERE PhotoId = @PhotoId
	
    
END


GO
/****** Object:  StoredProcedure [dbo].[Delete_Publication]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_Publication]
    @PublicationId INT,
	@UserId INT
	
   
AS
BEGIN
	UPDATE Publication
	SET Status=0,
	UserId = @UserId
    WHERE PublicationId = @PublicationId
	
    
END


GO
/****** Object:  StoredProcedure [dbo].[Delete_Report]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_Report]
    @ReportId INT,
	@UserId INT
	
   
AS
BEGIN
	UPDATE Report
	SET Status=0,
	UserId = @UserId
    WHERE ReportId = @ReportId
	
    
END


GO
/****** Object:  StoredProcedure [dbo].[Delete_Story]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_Story]
    @StoryId INT,
	@UserId INT
	
   
AS
BEGIN
	UPDATE Story
	SET Status=0,
	UserId = @UserId
    WHERE StoryId = @StoryId
	
    
END


GO
/****** Object:  StoredProcedure [dbo].[Delete_StoryPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Delete_StoryPhoto]
    @PhotoId INT,
	@StoryId INT
	
	
   
AS
BEGIN
	UPDATE StoryPhoto
	SET Status=0,
	StoryId = @StoryId
    WHERE PhotoId = @PhotoId
	
    
END


GO
/****** Object:  StoredProcedure [dbo].[Insert_Achievement]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Achievement]
    @AchievementTitle NVARCHAR(500),
	@AchievementDetail NVARCHAR(MAX),
	@UserId INT,
	@Status BIT

	
AS
BEGIN

    INSERT INTO Achievement(AchievementTitle,AchievementDetail,CreateDate,UserId,Status)
    VALUES(@AchievementTitle,@AchievementDetail,GETUTCDATE(),@UserId,@Status)
    
END


GO
/****** Object:  StoredProcedure [dbo].[Insert_Banner]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Banner]
	@PhotoPath NVARCHAR(500),
	@BannerInformation NVARCHAR(500),
	@UserId INT,
	@Status BIT
	
   
AS
BEGIN
	INSERT INTO Banner(PhotoPath,BannerInformation,CreateDate,UserId,Status)
    VALUES(@PhotoPath,@BannerInformation,GETUTCDATE(),@UserId,@Status)
    
END


GO
/****** Object:  StoredProcedure [dbo].[Insert_Event]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Event] 		
	@EventTitle NVARCHAR(500),
	@EventDetail NVARCHAR(MAX),
	@EventDate DATETIME,
	@UserId INT,
	@Status BIT
AS
BEGIN 
    INSERT INTO Event(EventTitle,EventDetail,EventDate,CreateDate,UserId,Status)
    VALUES(@EventTitle,@EventDetail,@EventDate,GETUTCDATE(),@UserId,@Status)
END


GO
/****** Object:  StoredProcedure [dbo].[Insert_EventPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_EventPhoto]
	@EventId INT,
	@PhotoPath NVARCHAR(500),
	@Status BIT	
AS
BEGIN
	INSERT INTO EventPhoto(EventId,PhotoPath,CreateDate,Status)
    VALUES(@EventId,@PhotoPath,GETUTCDATE(),@Status)
END


GO
/****** Object:  StoredProcedure [dbo].[Insert_News]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_News]
    @NewsTitle NVARCHAR(500),
	@NewsLink NVARCHAR(500),
	@UserId INT,
	@Status BIT
   
AS
BEGIN
	INSERT INTO News(NewsTitle,NewsLink,CreateDate,UserId,Status)
    VALUES(@NewsTitle,@NewsLink,GETUTCDATE(),@UserId,@Status)
    
END


GO
/****** Object:  StoredProcedure [dbo].[Insert_PhotoGallery]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_PhotoGallery]
	@PhotoPath NVARCHAR(500),
	@PhotoBrief NVARCHAR(100),
	@PhotoDetail NVARCHAR(500),
	@UserId INT,
	@Status BIT
	
   
AS
BEGIN
	INSERT INTO PhotoGallery(PhotoPath,PhotoBrief,PhotoDetail,CreateDate,UserId,Status)
    VALUES(@PhotoPath,@PhotoBrief,@PhotoDetail,GETUTCDATE(),@UserId,@Status)
    
END


GO
/****** Object:  StoredProcedure [dbo].[Insert_Publication]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Publication]
	@PublicationTitle NVARCHAR(500),
	@PublicationPath NVARCHAR(500),
	@UserId INT,
	@Status BIT
	
   
AS
BEGIN
	INSERT INTO Publication(PublicationTitle,PublicationPath,CreateDate,UserId,Status)
    VALUES(@PublicationTitle,@PublicationPath,GETUTCDATE(),@UserId,@Status)
    
END


GO
/****** Object:  StoredProcedure [dbo].[Insert_Report]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Report]
	@ReportTitle NVARCHAR(500),
	@ReportPath NVARCHAR(500),
	@UserId INT,
	@Status BIT
	
   
AS
BEGIN
	INSERT INTO Report(ReportTitle,ReportPath,CreateDate,UserId,Status)
    VALUES(@ReportTitle,@ReportPath,GETUTCDATE(),@UserId,@Status)
    
END


GO
/****** Object:  StoredProcedure [dbo].[Insert_Story]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Story]
	@StoryTitle NVARCHAR(500),
	@StoryDetail NVARCHAR(MAX),
	@UserId INT,
	@Status BIT	
   
AS

BEGIN
	INSERT INTO Story(StoryTitle,StoryDetail,CreateDate,UpdateDate,UserId,Status)
    VALUES(@StoryTitle,@StoryDetail,GETUTCDATE(),GETUTCDATE(),@UserId,@Status)
END 


GO
/****** Object:  StoredProcedure [dbo].[Insert_StoryPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_StoryPhoto]
	@StoryId INT,
	@PhotoPath NVARCHAR(500),
	@Status BIT	
AS
BEGIN
	INSERT INTO StoryPhoto(StoryId,PhotoPath,CreateDate,Status)
    VALUES(@StoryId,@PhotoPath,GETUTCDATE(),@Status)
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Achievement]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_Achievement]
    
   
AS
BEGIN
	SELECT * FROM [Achievement]
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Achievement_StaticPage]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_Achievement_StaticPage]    
   
AS
BEGIN
	SELECT * FROM Achievement 
	WHERE Status= 1 ORDER BY CreateDate DESC
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_AchievementPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_AchievementPhoto]
    
   
AS
BEGIN
	SELECT * FROM AchievementPhoto
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_AchievementPhoto_StaticPage]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_AchievementPhoto_StaticPage]
   @AchievementId INT 
   
AS
BEGIN
	SELECT ap.PhotoPath FROM AchievementPhoto ap
	INNER JOIN Achievement a ON a.AchievementId = ap.AchievementId 
	WHERE ap.AchievementId = @AchievementId AND ap.Status=1
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Banner]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_Banner]
    
   
AS
BEGIN
	SELECT * FROM Banner
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Event]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_Event]
   
AS
BEGIN
	SELECT EventId, EventTitle, EventDetail, 
	dateadd(minute, datepart(TZoffset, sysdatetimeoffset()), EventDate) as EventDate, Status
	FROM Event e
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Event_StaticPage]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_Event_StaticPage]    
   
AS
BEGIN
	SELECT EventId, EventTitle, EventDetail, 
	dateadd(minute, datepart(TZoffset, sysdatetimeoffset()), EventDate) as EventDate  FROM [Event] 
	WHERE Status= 1 ORDER BY dateadd(minute, datepart(TZoffset, sysdatetimeoffset()), EventDate) DESC
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_EventPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_EventPhoto]
    
   
AS
BEGIN
	SELECT * FROM EventPhoto
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_EventPhoto_StaticPage]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_EventPhoto_StaticPage]
   @EventId INT 
   
AS
BEGIN
	SELECT ep.PhotoPath FROM [EventPhoto] ep
	INNER JOIN [Event] e ON e.EventId = ep.EventId 
	WHERE ep.EventId = @EventId AND ep.Status=1
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_News]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_News]
    
   
AS
BEGIN
	SELECT * FROM News
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_PhotoGallery]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_PhotoGallery]
    
   
AS
BEGIN
	SELECT * FROM PhotoGallery
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Publication]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_Publication]
    
   
AS
BEGIN
	SELECT * FROM Publication
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Report]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_Report]
    
   
AS
BEGIN
	SELECT * FROM Report
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Story]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_Story]
    
   
AS
BEGIN
	SELECT * FROM Story
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_Story_StaticPage]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_Story_StaticPage]    
   
AS
BEGIN
	SELECT s.StoryId, s.StoryTitle, s.StoryDetail, 
	dateadd(minute, datepart(TZoffset, sysdatetimeoffset()), s.UpdateDate) as UpdateDate,
	u.UserName FROM [Story] s
	INNER JOIN [User] u ON u.UserId = s.UserId
	WHERE s.Status= 1 ORDER BY dateadd(minute, datepart(TZoffset, sysdatetimeoffset()), s.UpdateDate) DESC
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_StoryPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_StoryPhoto]
    
   
AS
BEGIN
	SELECT sp.PhotoId, sp.StoryId, sp.PhotoPath, s.Status as StoryStatus, sp.Status as PhotoStatus FROM StoryPhoto sp
	INNER JOIN [Story] s ON s.StoryId = sp.StoryId 
END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_StoryPhoto_HomePage]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_StoryPhoto_HomePage]
   @StoryId INT 
   
AS
BEGIN
	SELECT TOP 1 sp.PhotoPath FROM StoryPhoto sp 
	INNER JOIN [Story] s ON s.StoryId = sp.StoryId 
	WHERE sp.StoryId = @StoryId AND sp.Status=1

END


GO
/****** Object:  StoredProcedure [dbo].[SelectAll_StoryPhoto_StaticPage]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAll_StoryPhoto_StaticPage]
   @StoryId INT 
   
AS
BEGIN
	SELECT sp.PhotoPath FROM StoryPhoto sp 
	INNER JOIN [Story] s ON s.StoryId = sp.StoryId 
	WHERE sp.StoryId = @StoryId AND sp.Status=1

END


GO
/****** Object:  StoredProcedure [dbo].[SelectByAchievementId_AchievementPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectByAchievementId_AchievementPhoto]
    @AchievementId INT
   
AS
BEGIN
	SELECT * FROM AchievementPhoto WHERE AchievementId = @AchievementId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectByCredentiaInfo_User]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectByCredentiaInfo_User]
	@Email NVARCHAR(50),
	@Password NVARCHAR(50)
AS
BEGIN
    SELECT * FROM [User] WHERE Email = @Email and Password= @Password
END


GO
/****** Object:  StoredProcedure [dbo].[SelectByEmail_User]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectByEmail_User]
	@Email NVARCHAR(50)
AS
BEGIN
    SELECT * FROM [User] WHERE Email = @Email
END


GO
/****** Object:  StoredProcedure [dbo].[SelectByEventId_EventPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectByEventId_EventPhoto]
    @EventId INT
   
AS
BEGIN
	SELECT * FROM EventPhoto WHERE EventId = @EventId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_Achievement]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_Achievement]
    @AchievementId INT
   
AS
BEGIN
	SELECT * FROM Achievement WHERE AchievementId = @AchievementId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_AchievementPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_AchievementPhoto]
    @PhotoId INT
   
AS
BEGIN
	SELECT * FROM AchievementPhoto  WHERE PhotoId = @PhotoId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_Banner]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_Banner]
    @BannerId INT
   
AS
BEGIN
	SELECT * FROM Banner WHERE BannerId = @BannerId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_Event]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_Event]
   @EventId INT
AS
BEGIN
	SELECT EventId, EventTitle, EventDetail, 
	dateadd(minute, datepart(TZoffset, sysdatetimeoffset()), EventDate) as EventDate, Status
	FROM Event  WHERE EventId = @EventId
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_EventPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_EventPhoto]
    @PhotoId INT
   
AS
BEGIN
	SELECT * FROM EventPhoto  WHERE PhotoId = @PhotoId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_News]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_News]
    @NewsId INT
   
AS
BEGIN
	SELECT * FROM News WHERE NewsId = @NewsId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_PhotoGallery]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_PhotoGallery]
    @PhotoId INT
   
AS
BEGIN
	SELECT * FROM PhotoGallery WHERE PhotoId = @PhotoId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_Publication]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_Publication]
    @PublicationId INT
   
AS
BEGIN
	SELECT * FROM Publication WHERE PublicationId = @PublicationId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_Report]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_Report]
    @ReportId INT
   
AS
BEGIN
	SELECT * FROM Report WHERE ReportId = @ReportId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_Story]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_Story]
    @StoryId INT
   
AS
BEGIN
	SELECT * FROM Story WHERE StoryId = @StoryId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectById_StoryPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectById_StoryPhoto]
    @PhotoId INT
   
AS
BEGIN
	SELECT sp.PhotoId, sp.StoryId, sp.PhotoPath, s.Status as StoryStatus, sp.Status as PhotoStatus FROM [StoryPhoto] sp
	INNER JOIN [Story] s ON s.StoryId = sp.StoryId  WHERE sp.PhotoId = @PhotoId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectByStoryId_StoryPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectByStoryId_StoryPhoto]
    @StoryId INT
   
AS
BEGIN
	SELECT sp.PhotoId, sp.StoryId, sp.PhotoPath, s.Status as StoryStatus, sp.Status as PhotoStatus FROM [StoryPhoto] sp
	INNER JOIN [Story] s ON s.StoryId = sp.StoryId WHERE sp.StoryId = @StoryId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectByUserId_Story]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[SelectByUserId_Story]
    @UserId INT
   
AS
BEGIN
	SELECT * FROM Story WHERE UserId = @UserId
    
END


GO
/****** Object:  StoredProcedure [dbo].[SelectByUserId_StoryPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectByUserId_StoryPhoto]    
    @UserId INT
   
AS
BEGIN
	SELECT sp.PhotoId, sp.StoryId, sp.PhotoPath, s.Status as StoryStatus, sp.Status as PhotoStatus FROM StoryPhoto sp
	INNER JOIN [Story] s ON s.StoryId = sp.StoryId 
	INNER JOIN [User] u ON u.UserId = s.UserId
	WHERE u.UserId = @UserId
END


GO
/****** Object:  StoredProcedure [dbo].[Update_Achievement]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Achievement]
    @AchievementId INT,
    @AchievementTitle NVARCHAR(500),
	@AchievementDetail NVARCHAR(MAX),
	@UserId INT,
	@Status BIT

	
AS
BEGIN
	UPDATE Achievement
	SET AchievementTitle = @AchievementTitle,
		AchievementDetail = @AchievementDetail,
		UserId = @UserId,
		Status = @Status
    WHERE AchievementId = @AchievementId
    
END


GO
/****** Object:  StoredProcedure [dbo].[Update_AchievementPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_AchievementPhoto]
    @PhotoId INT,
	@AchievementId INT,
	@PhotoPath NVARCHAR(500),
	@Status BIT
   
AS
BEGIN
	UPDATE AchievementPhoto	
	SET AchievementId = @AchievementId, 
	    PhotoPath = @PhotoPath,
		Status = @Status
    WHERE PhotoId = @PhotoId
END


GO
/****** Object:  StoredProcedure [dbo].[Update_Banner]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Banner]
    @BannerId INT,
	@PhotoPath NVARCHAR(500),
	@BannerInformation NVARCHAR(500),
	@UserId INT,
	@Status BIT
AS
BEGIN
	UPDATE Banner
	SET PhotoPath = @PhotoPath,
		BannerInformation = @BannerInformation,
		UserId = @UserId,
		Status = @Status
    WHERE BannerId = @BannerId
   
END


GO
/****** Object:  StoredProcedure [dbo].[Update_Event]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Event]
    @EventId INT,		
	@EventTitle NVARCHAR(500),
	@EventDetail NVARCHAR(MAX),
	@EventDate DATETIME,
	@UserId INT,
	@Status BIT
AS
BEGIN 
	UPDATE Event 
	SET EventTitle=@EventTitle,
	    EventDetail=@EventDetail,
		EventDate=@EventDate,
		UserId=@UserId,
		Status=@Status
    WHERE EventId = @EventId
END


GO
/****** Object:  StoredProcedure [dbo].[Update_EventPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_EventPhoto]
    @PhotoId INT,
	@EventId INT,
	@PhotoPath NVARCHAR(500),
	@Status BIT
   
AS
BEGIN
	UPDATE EventPhoto	
	SET EventId = @EventId, 
	    PhotoPath = @PhotoPath,
		Status = @Status
    WHERE PhotoId = @PhotoId
END


GO
/****** Object:  StoredProcedure [dbo].[Update_News]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_News]
    @NewsId INT,
	@NewsTitle NVARCHAR(500),
	@NewsLink NVARCHAR(500),
	@UserId INT,
	@Status BIT
   
AS
BEGIN
	UPDATE News
	SET NewsTitle = @NewsTitle,
		NewsLink = @NewsLink,
		UserId = @UserId,
		Status = @Status
    WHERE NewsId = @NewsId
	
    
END


GO
/****** Object:  StoredProcedure [dbo].[Update_PhotoGallery]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_PhotoGallery]
    @PhotoId INT,
	@PhotoPath NVARCHAR(500),
	@PhotoBrief NVARCHAR(100),
	@PhotoDetail NVARCHAR(500),
	@UserId INT,
	@Status BIT
AS
BEGIN
	UPDATE PhotoGallery
	SET PhotoPath = @PhotoPath,
		PhotoBrief = @PhotoBrief,
		PhotoDetail = @PhotoDetail,
		UserId = @UserId,
		Status = @Status
    WHERE PhotoId = @PhotoId
   
END


GO
/****** Object:  StoredProcedure [dbo].[Update_Publication]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Publication]
    @PublicationId INT,
	@PublicationTitle NVARCHAR(500),
	@PublicationPath NVARCHAR(500),
	@UserId INT,
	@Status BIT
	
   
AS
BEGIN
	UPDATE Publication
	SET PublicationTitle = @PublicationTitle,
		PublicationPath = @PublicationPath,
		UserId = @UserId,
		Status = @Status
    WHERE PublicationId = @PublicationId
	
    
END


GO
/****** Object:  StoredProcedure [dbo].[Update_Report]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Report]
    @ReportId INT,
	@ReportTitle NVARCHAR(500),
	@ReportPath NVARCHAR(500),
	@UserId INT,
	@Status BIT
	
   
AS
BEGIN
	UPDATE Report
	SET ReportTitle = @ReportTitle,
		ReportPath = @ReportPath,
		UserId = @UserId,
		Status = @Status
    WHERE ReportId = @ReportId
	
    
END


GO
/****** Object:  StoredProcedure [dbo].[Update_Story]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Story]
    @StoryId INT,
	@StoryTitle NVARCHAR(500),
	@StoryDetail NVARCHAR(MAX),
	@UpdateDate DATETIME,
	@Status BIT
	
   
AS
BEGIN
	UPDATE Story
	SET StoryTitle = @StoryTitle,
		StoryDetail = @StoryDetail,
		UpdateDate = @UpdateDate,
		Status = @Status
    WHERE StoryId = @StoryId    
END


GO
/****** Object:  StoredProcedure [dbo].[Update_StoryPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_StoryPhoto]
    @PhotoId INT,
	@StoryId INT,
	@PhotoPath NVARCHAR(500),
	@Status BIT
   
AS
BEGIN
	UPDATE StoryPhoto	
	SET StoryId = @StoryId, 
	    PhotoPath = @PhotoPath,
		Status = @Status
    WHERE PhotoId = @PhotoId
END


GO
/****** Object:  Table [dbo].[Achievement]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievement](
	[AchievementId] [int] IDENTITY(1,1) NOT NULL,
	[AchievementTitle] [nvarchar](500) NULL,
	[AchievementDetail] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Achievement] PRIMARY KEY CLUSTERED 
(
	[AchievementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AchievementPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievementPhoto](
	[PhotoId] [int] IDENTITY(1,1) NOT NULL,
	[AchievementId] [int] NULL,
	[PhotoPath] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_AchievementPhoto] PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Banner]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[PhotoPath] [nvarchar](500) NULL,
	[BannerInformation] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[EventTitle] [nvarchar](500) NULL,
	[EventDetail] [nvarchar](max) NULL,
	[EventDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPhoto](
	[PhotoId] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NULL,
	[PhotoPath] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_EventPhoto] PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[NewsTitle] [nvarchar](500) NULL,
	[NewsLink] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotoGallery]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoGallery](
	[PhotoId] [int] IDENTITY(1,1) NOT NULL,
	[PhotoPath] [nvarchar](500) NULL,
	[PhotoBrief] [nvarchar](100) NULL,
	[PhotoDetail] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_PhotoGallery] PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publication]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publication](
	[PublicationId] [int] IDENTITY(1,1) NOT NULL,
	[PublicationTitle] [nvarchar](500) NULL,
	[PublicationPath] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Publication] PRIMARY KEY CLUSTERED 
(
	[PublicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[ReportTitle] [nvarchar](500) NULL,
	[ReportPath] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleType] [nvarchar](25) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Story]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Story](
	[StoryId] [int] IDENTITY(1,1) NOT NULL,
	[StoryTitle] [nvarchar](500) NULL,
	[StoryDetail] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Story] PRIMARY KEY CLUSTERED 
(
	[StoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StoryPhoto]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoryPhoto](
	[PhotoId] [int] IDENTITY(1,1) NOT NULL,
	[StoryId] [int] NULL,
	[PhotoPath] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_StoryPhoto] PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/4/2019 1:49:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Achievement] ON 

INSERT [dbo].[Achievement] ([AchievementId], [AchievementTitle], [AchievementDetail], [CreateDate], [UserId], [Status]) VALUES (7, N'Test Achievement', N'<h2 class="bNg8Rb" style="clip: rect(1px, 1px, 1px, 1px); height: 1px; margin: 0px; overflow: hidden; padding: 0px; position: absolute; white-space: nowrap; width: 1px; z-index: -1000; color: #222222; font-family: arial, sans-serif;">Description</h2>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">An achievement, armorial achievement or heraldic achievement in heraldry is a full display or depiction of all the heraldic components to which the bearer of a coat of arms is entitled.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">An achievement, armorial achievement or heraldic achievement in heraldry is a full display or depiction of all the heraldic components to which the bearer of a coat of arms is entitled.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">An achievement, armorial achievement or heraldic achievement in heraldry is a full display or depiction of all the heraldic components to which the bearer of a coat of arms is entitled.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">An achievement, armorial achievement or heraldic achievement in heraldry is a full display or depiction of all the heraldic components to which the bearer of a coat of arms is entitled.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">An achievement, armorial achievement or heraldic achievement in heraldry is a full display or depiction of all the heraldic components to which the bearer of a coat of arms is entitled.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">An achievement, armorial achievement or heraldic achievement in heraldry is a full display or depiction of all the heraldic components to which the bearer of a coat of arms is entitled.</span></p>', CAST(0x0000AAFA014ACD66 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Achievement] OFF
SET IDENTITY_INSERT [dbo].[AchievementPhoto] ON 

INSERT [dbo].[AchievementPhoto] ([PhotoId], [AchievementId], [PhotoPath], [CreateDate], [Status]) VALUES (5, 7, N'7bb4be3d-8adb-4286-8287-debda17746be.jpg', NULL, 1)
SET IDENTITY_INSERT [dbo].[AchievementPhoto] OFF
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([BannerId], [PhotoPath], [BannerInformation], [CreateDate], [UserId], [Status]) VALUES (6, N'feb7d128-34b3-4d3b-b535-65ee8fecc50d.jpg', N'Old Dhaka', CAST(0x0000AAFA014CD538 AS DateTime), 1, 1)
INSERT [dbo].[Banner] ([BannerId], [PhotoPath], [BannerInformation], [CreateDate], [UserId], [Status]) VALUES (7, N'82284ebe-b5df-4938-a701-a1223f747311.jpg', N'Old Dhaka', CAST(0x0000AAFA014CEC9A AS DateTime), 1, 1)
INSERT [dbo].[Banner] ([BannerId], [PhotoPath], [BannerInformation], [CreateDate], [UserId], [Status]) VALUES (8, N'ca296356-aea7-432a-85a3-ac6dead79c57.jpg', N'Old Dhaka', CAST(0x0000AAFA014D0295 AS DateTime), 1, 1)
INSERT [dbo].[Banner] ([BannerId], [PhotoPath], [BannerInformation], [CreateDate], [UserId], [Status]) VALUES (9, N'593b3478-19e6-49e5-adb2-629b02185262.jpg', N'Old Dhaka', CAST(0x0000AAFA014D19E4 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventId], [EventTitle], [EventDetail], [EventDate], [CreateDate], [UserId], [Status]) VALUES (24, N'Test Event', N'<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">In philosophy, events are objects in time or instantiations of properties in objects.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">In philosophy, events are objects in time or instantiations of properties in objects.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">In philosophy, events are objects in time or instantiations of properties in objects.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">In philosophy, events are objects in time or instantiations of properties in objects.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">In philosophy, events are objects in time or instantiations of properties in objects.</span></p>', CAST(0x0000AB14014A7B84 AS DateTime), CAST(0x0000AAFA014A84E0 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[EventPhoto] ON 

INSERT [dbo].[EventPhoto] ([PhotoId], [EventId], [PhotoPath], [CreateDate], [Status]) VALUES (8, 24, N'791858b7-096b-434e-a44c-3db863156a5e.jpg', NULL, 1)
SET IDENTITY_INSERT [dbo].[EventPhoto] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [NewsTitle], [NewsLink], [CreateDate], [UserId], [Status]) VALUES (5, N'Blazing Mushfiqur fifty fires Bangladesh to emphatic, first T20 victory against India', N'https://bdnews24.com/cricket/2019/11/03/blazing-mushfiqur-fifty-fires-bangladesh-to-emphatic-first-t20-victory-against-india', CAST(0x0000AAFA014A2E61 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[PhotoGallery] ON 

INSERT [dbo].[PhotoGallery] ([PhotoId], [PhotoPath], [PhotoBrief], [PhotoDetail], [CreateDate], [UserId], [Status]) VALUES (20, N'54b3fb62-3b1d-472b-ab95-d62e96ba05d8.jpg', N'OLD DHAKA', N'Old Dhaka', CAST(0x0000AAFA014C4275 AS DateTime), 1, 1)
INSERT [dbo].[PhotoGallery] ([PhotoId], [PhotoPath], [PhotoBrief], [PhotoDetail], [CreateDate], [UserId], [Status]) VALUES (21, N'6f5fd169-1567-4d7d-8519-7bc4dbb122e9.jpg', N'OLD DHAKA', N'Old Dhaka', CAST(0x0000AAFA014C674D AS DateTime), 1, 1)
INSERT [dbo].[PhotoGallery] ([PhotoId], [PhotoPath], [PhotoBrief], [PhotoDetail], [CreateDate], [UserId], [Status]) VALUES (22, N'33187768-e977-4c3a-acb6-b3827ff12e29.jpg', N'OLD DHAKA', N'Old Dhaka', CAST(0x0000AAFA014C8877 AS DateTime), 1, 1)
INSERT [dbo].[PhotoGallery] ([PhotoId], [PhotoPath], [PhotoBrief], [PhotoDetail], [CreateDate], [UserId], [Status]) VALUES (23, N'07769c64-0789-4570-947d-db560b98acf1.jpg', N'OLD DHAKA', N'Old Dhaka', CAST(0x0000AAFA014CA4D1 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[PhotoGallery] OFF
SET IDENTITY_INSERT [dbo].[Publication] ON 

INSERT [dbo].[Publication] ([PublicationId], [PublicationTitle], [PublicationPath], [CreateDate], [UserId], [Status]) VALUES (7, N'Test Publication', N'http://lib.buet.ac.bd:8080/xmlui/handle/123456789/4955', CAST(0x0000AAFA0149E2DB AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Publication] OFF
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([ReportId], [ReportTitle], [ReportPath], [CreateDate], [UserId], [Status]) VALUES (7, N'Test Report', N'758c6d1c-b66c-4918-bd47-4e1b0b26948c.docx', CAST(0x0000AAFA01488C75 AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleType]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([RoleId], [RoleType]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Story] ON 

INSERT [dbo].[Story] ([StoryId], [StoryTitle], [StoryDetail], [CreateDate], [UpdateDate], [UserId], [Status]) VALUES (48, N'Test Story', N'<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">A narrative or story, is an account of a series of related events, experiences, or the like, whether true or fictitious. The word derives from the Latin verb narrare, which is derived from the adjective gnarus.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">A narrative or story, is an account of a series of related events, experiences, or the like, whether true or fictitious. The word derives from the Latin verb narrare, which is derived from the adjective gnarus.</span></p>
<p><span style="color: #222222; font-family: arial, sans-serif; font-size: 14px;">A narrative or story, is an account of a series of related events, experiences, or the like, whether true or fictitious. The word derives from the Latin verb narrare, which is derived from the adjective gnarus.</span></p>', CAST(0x0000AAFA0147A931 AS DateTime), CAST(0x0000AAFA01512E6F AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Story] OFF
SET IDENTITY_INSERT [dbo].[StoryPhoto] ON 

INSERT [dbo].[StoryPhoto] ([PhotoId], [StoryId], [PhotoPath], [CreateDate], [Status]) VALUES (53, 48, N'e16bb25a-d8c6-4863-b17e-dce6532fe59e.jpg', CAST(0x0000AAFB002A1CCE AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[StoryPhoto] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [RoleId], [Status]) VALUES (1, N'sumon', N'12345678', N'sumu@mail.com', 1, 1)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Email], [RoleId], [Status]) VALUES (2, N'rahman', N'87654321', N'rahman@mail.com', 2, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[StoryPhoto] ADD  CONSTRAINT [DF_StoryPhoto_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Achievement]  WITH CHECK ADD  CONSTRAINT [FK_Achievement_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Achievement] CHECK CONSTRAINT [FK_Achievement_User]
GO
ALTER TABLE [dbo].[AchievementPhoto]  WITH NOCHECK ADD  CONSTRAINT [FK_AchievementPhoto_Achievement] FOREIGN KEY([AchievementId])
REFERENCES [dbo].[Achievement] ([AchievementId])
GO
ALTER TABLE [dbo].[AchievementPhoto] CHECK CONSTRAINT [FK_AchievementPhoto_Achievement]
GO
ALTER TABLE [dbo].[Banner]  WITH CHECK ADD  CONSTRAINT [FK_Banner_Banner] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Banner] CHECK CONSTRAINT [FK_Banner_Banner]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Event] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Event]
GO
ALTER TABLE [dbo].[EventPhoto]  WITH NOCHECK ADD  CONSTRAINT [FK_EventPhoto_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[EventPhoto] CHECK CONSTRAINT [FK_EventPhoto_Event]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
GO
ALTER TABLE [dbo].[PhotoGallery]  WITH CHECK ADD  CONSTRAINT [FK_PhotoGallery_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[PhotoGallery] CHECK CONSTRAINT [FK_PhotoGallery_User]
GO
ALTER TABLE [dbo].[Publication]  WITH CHECK ADD  CONSTRAINT [FK_Publication_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Publication] CHECK CONSTRAINT [FK_Publication_User]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User]
GO
ALTER TABLE [dbo].[Story]  WITH CHECK ADD  CONSTRAINT [FK_Story_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Story] CHECK CONSTRAINT [FK_Story_User]
GO
ALTER TABLE [dbo].[StoryPhoto]  WITH NOCHECK ADD  CONSTRAINT [FK_StoryPhoto_Story] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Story] ([StoryId])
GO
ALTER TABLE [dbo].[StoryPhoto] CHECK CONSTRAINT [FK_StoryPhoto_Story]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
