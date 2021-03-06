USE [master]
GO
/****** Object:  Database [Medical]    Script Date: 08/04/2015 14:41:06 ******/
CREATE DATABASE [Medical] ON  PRIMARY 
( NAME = N'Medical', FILENAME = N'E:\Chanh\Database\Medical.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Medical_log', FILENAME = N'E:\Chanh\Database\Medical_1.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Medical] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Medical].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Medical] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Medical] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Medical] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Medical] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Medical] SET ARITHABORT OFF
GO
ALTER DATABASE [Medical] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Medical] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Medical] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Medical] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Medical] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Medical] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Medical] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Medical] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Medical] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Medical] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Medical] SET  DISABLE_BROKER
GO
ALTER DATABASE [Medical] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Medical] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Medical] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Medical] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Medical] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Medical] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Medical] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Medical] SET  READ_WRITE
GO
ALTER DATABASE [Medical] SET RECOVERY FULL
GO
ALTER DATABASE [Medical] SET  MULTI_USER
GO
ALTER DATABASE [Medical] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Medical] SET DB_CHAINING OFF
GO
USE [Medical]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 08/04/2015 14:41:06 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
/****** Object:  Table [dbo].[Organisation]    Script Date: 08/04/2015 14:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organisation](
	[OrganisationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[ContactInformationID] [int] NOT NULL,
	[DisplayIndex] [int] NOT NULL,
	[IsLegacy] [bit] NOT NULL,
	[AuthorisationCode] [varchar](128) NOT NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Organisation] PRIMARY KEY CLUSTERED 
(
	[OrganisationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImageType]    Script Date: 08/04/2015 14:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImageType](
	[ImageTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_ImageType] PRIMARY KEY CLUSTERED 
(
	[ImageTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Component]    Script Date: 08/04/2015 14:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Component](
	[ComponentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Component] PRIMARY KEY CLUSTERED 
(
	[ComponentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 08/04/2015 14:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Concurrency] [timestamp] NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateUpdated] [smalldatetime] NULL,
	[CreatedBy] [varchar](128) NULL,
	[UpdatedBy] [varchar](128) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactType]    Script Date: 08/04/2015 14:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactType](
	[ContactTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_ContactType] PRIMARY KEY CLUSTERED 
(
	[ContactTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetRoleRank]    Script Date: 08/04/2015 14:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetRoleRank]
(
@RoleId uniqueidentifier
)
RETURNS int
AS
BEGIN
DECLARE @Result int

SELECT @Result = CASE @RoleId
WHEN '0FEA5EAE-C34F-4E6B-817F-8ABA46697F19' THEN 1	-- Portal Admin
WHEN '0DA03E27-E0F9-419E-A5F1-3FA7A1219AFB' THEN 2	-- Organisation Admin
WHEN '4030222F-1655-42D7-9C2A-4278E105228C' THEN 3	-- Site Admin
ELSE 1000 -- others select * from aspnet_roles
END
RETURN @Result

END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnSplit]    Script Date: 08/04/2015 14:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnSplit](@sep char(1), @s varchar(MAX))
returns @temptable
TABLE
(
Id int NOT NULL IDENTITY (1, 1)
, Token varchar(MAX) NULL
)
AS BEGIN

    declare @idx int
    declare @split varchar(max)

    select @idx = 1
        if len(@s )<1 or @s is null return

    while @idx!= 0
    begin
        set @idx = charindex(@sep,@s)
        if @idx!=0
            set @split= left(@s,@idx - 1)
        else
            set @split= @s

        if(len(@split)>0)
            insert into @temptable(Token) values(ltrim(rtrim(@split)))

        set @s= right(@s,len(@s) - @idx)
        if len(@s) = 0 break
    end

return

-- ======================================================================
-- Change History
-- ======================================================================
-- 14-Mar-2014 HT
-- Init

END
GO
/****** Object:  Table [dbo].[TagVersion]    Script Date: 08/04/2015 14:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TagVersion](
	[TagVersionID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](128) NULL,
	[Version] [varchar](128) NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NULL,
 CONSTRAINT [PK_TagVersion] PRIMARY KEY CLUSTERED 
(
	[TagVersionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 08/04/2015 14:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 08/04/2015 14:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 08/04/2015 14:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name sysname,
        Group_id smallint,
        Users_in_group sysname,
        User_id smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 08/04/2015 14:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtilityDays]    Script Date: 08/04/2015 14:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtilityDays](
	[DateEntry] [smalldatetime] NOT NULL,
	[DateWeekStarting]  AS (case datepart(weekday,[DateEntry]) when (2) then [DateEntry] when (3) then dateadd(day,(-1),[DateEntry]) when (4) then dateadd(day,(-2),[DateEntry]) when (5) then dateadd(day,(-3),[DateEntry]) when (6) then dateadd(day,(-4),[DateEntry]) when (7) then dateadd(day,(-5),[DateEntry]) when (1) then dateadd(day,(-6),[DateEntry])  end),
	[DateWeekEnding]  AS (case datepart(weekday,[DateEntry]) when (1) then [DateEntry] when (2) then dateadd(day,(6),[DateEntry]) when (3) then dateadd(day,(5),[DateEntry]) when (4) then dateadd(day,(4),[DateEntry]) when (5) then dateadd(day,(3),[DateEntry]) when (6) then dateadd(day,(2),[DateEntry]) when (7) then dateadd(day,(1),[DateEntry])  end),
	[DateMonthStarting]  AS (CONVERT([smalldatetime],(('01-'+CONVERT([varchar](3),[DateEntry],(109)))+'-')+CONVERT([varchar](4),datepart(year,[DateEntry]),(0)),(0))),
	[DateMonthEnding]  AS (dateadd(day,(-1),dateadd(month,(1),(('01-'+CONVERT([varchar](3),[DateEntry],(109)))+'-')+CONVERT([varchar](4),datepart(year,[DateEntry]),(0))))),
	[DateYear1] [smalldatetime] NULL,
	[DateYear2] [smalldatetime] NULL,
	[DateYear3] [smalldatetime] NULL,
	[DateYear4] [smalldatetime] NULL,
	[DateYear5] [smalldatetime] NULL,
	[DayOfWeek]  AS (datepart(weekday,[DateEntry])),
	[Day]  AS (datepart(day,[DateEntry])),
	[Month]  AS (datepart(month,[DateEntry])),
	[Quarter]  AS (datepart(quarter,[DateEntry])),
	[Year]  AS (datepart(year,[DateEntry])),
	[DateYear1Offset] [smalldatetime] NULL,
	[DateYear2Offset] [smalldatetime] NULL,
	[DateYear3Offset] [smalldatetime] NULL,
	[DateYear4Offset] [smalldatetime] NULL,
	[DateYear5Offset] [smalldatetime] NULL,
 CONSTRAINT [PK_UtilityDays] PRIMARY KEY CLUSTERED 
(
	[DateEntry] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnSplitNumeric]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnSplitNumeric] (@sep char(1), @s varchar(MAX))
RETURNS table
AS RETURN
SELECT
Id, convert(int, Token) AS Number
FROM
dbo.ufnSplit(@sep, @s)
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
	[OrganisationID] [int] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature nvarchar(128),
    @CompatibleSchemaVersion nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles] 
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature nvarchar(128),
    @CompatibleSchemaVersion nvarchar(128),
    @IsCurrentVersion bit,
    @RemoveIncompatibleSchema bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  Table [dbo].[Site]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Site](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationID] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[AbbreviatedName] [varchar](10) NULL,
	[ContactInformationID] [int] NULL,
	[LicenseKey] [uniqueidentifier] NULL,
	[PropCode] [varchar](50) NULL,
	[DisplayIndex] [int] NOT NULL,
	[IsLegacy] [bit] NOT NULL,
	[Availability] [int] NOT NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Service](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[IsLegacy] [bit] NOT NULL,
	[Price] [decimal](20, 8) NULL,
	[Unit] [nvarchar](50) NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[procSaveOrganisation]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveOrganisation]

@OrganisationID int OUTPUT,
@Name varchar(128),
@ContactInformationID int,	
@DisplayIndex int,
@IsLegacy bit,
@AuthorisationCode VARCHAR(128),
@CurrentUser varchar(128)
AS BEGIN

SET NOCOUNT ON

-- Insert record
IF @OrganisationID IS NULL
BEGIN

INSERT INTO Organisation(
Name ,
ContactInformationID ,	
DisplayIndex ,
IsLegacy ,
AuthorisationCode,
DateCreated,
DateUpdated,
CreatedBy,
UpdatedBy
) VALUES (
@Name ,
@ContactInformationID ,	
@DisplayIndex ,
@IsLegacy ,
@AuthorisationCode,
GETDATE(),
GETDATE(),
@CurrentUser,
@CurrentUser
)

SET @OrganisationID = SCOPE_IDENTITY()
END

-- Update record
ELSE
BEGIN
UPDATE Organisation SET

Name = @Name ,
ContactInformationID = @ContactInformationID ,	
DisplayIndex = @DisplayIndex ,
IsLegacy = @IsLegacy ,
AuthorisationCode = @AuthorisationCode,
DateUpdated = GETDATE(),
UpdatedBy = @CurrentUser

WHERE OrganisationID = @OrganisationID

END

-- Select concurrency
SELECT Concurrency FROM Organisation WHERE OrganisationID = @OrganisationID

-- ======================================================================
-- Change History
-- ======================================================================
-- 21-Feb-2014 HT
-- INIT
END
GO
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ContactInformation](
	[ContactInformationId] [int] IDENTITY(1,1) NOT NULL,
	[ContactTypeId] [int] NOT NULL,
	[FirstName] [nvarchar](128) NULL,
	[LastName] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Address2] [nvarchar](128) NULL,
	[District] [varchar](255) NULL,
	[DistrictId] [int] NULL,
	[City] [varchar](255) NULL,
	[CityId] [int] NULL,
	[State] [varchar](255) NULL,
	[Postcode] [varchar](50) NULL,
	[CountryId] [int] NULL,
	[PhoneNumber] [varchar](128) NULL,
	[FaxNumber] [varchar](128) NULL,
	[Email] [varchar](255) NULL,
	[DoB] [datetime] NULL,
	[Visa] [varchar](128) NULL,
	[VisaValidFrom] [datetime] NULL,
	[VisaValidTo] [datetime] NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_ContactInformation] PRIMARY KEY CLUSTERED 
(
	[ContactInformationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Concurrency] [timestamp] NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateUpdated] [smalldatetime] NULL,
	[CreatedBy] [varchar](128) NULL,
	[UpdatedBy] [varchar](128) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationID] [int] NOT NULL,
	[FirstName] [nvarchar](128) NOT NULL,
	[LastName] [nvarchar](128) NOT NULL,
	[IsLegacy] [bit] NOT NULL,
	[Gender] [int] NULL,
	[DoB] [smalldatetime] NULL,
	[ContactInformationId] [int] NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature nvarchar(128),
    @CompatibleSchemaVersion nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT *
                FROM dbo.aspnet_SchemaVersions
                WHERE Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName nvarchar(256),
    @ApplicationId uniqueidentifier OUTPUT
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
BEGIN TRANSACTION
SET @TranStarted = 1
        END
        ELSE
     SET @TranStarted = 0

        SELECT @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT @ApplicationId = NEWID()
            INSERT dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
SET @TranStarted = 0
COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  Table [dbo].[Image]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageTypeId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[FileName] [varchar](128) NULL,
	[ImageContent] [varbinary](max) NULL,
	[ImageSmallContent] [varbinary](max) NULL,
	[DisplayIndex] [int] NULL,
	[Description] [varchar](max) NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[procListComponent]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListComponent]	
@ComponentId int = null
AS
BEGIN
SET NOCOUNT ON

SELECT	ComponentId, Name,
Concurrency, DateCreated, DateUpdated, CreatedBy, UpdatedBy
FROM	Component
WHERE	(@ComponentId is null OR ComponentId = @ComponentId)

END
GO
/****** Object:  StoredProcedure [dbo].[procListCountry]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListCountry] (@CountryId int = NULL)

AS
BEGIN
SET NOCOUNT ON

SELECT CountryID, Name, Concurrency, DateCreated, DateUpdated, CreatedBy, UpdatedBy
FROM Country
WHERE (@CountryID IS NULL OR CountryId = @CountryId)
END
GO
/****** Object:  StoredProcedure [dbo].[procGetLatestTagVersion]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procGetLatestTagVersion]
AS
BEGIN
SET NOCOUNT ON

SELECT TOP 1 TagVersionID, TagName, Version, DateCreated, CreatedBy
FROM TagVersion
ORDER BY TagVersionID DESC
END
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Medicine](
	[MedicineId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsLegacy] [bit] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](20, 8) NULL,
	[InputPrice] [decimal](20, 8) NULL,
	[Unit] [nvarchar](128) NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[MedicineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedicineInput]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[MedicineInput](
	[MedicineInputId] [int] IDENTITY(1,1) NOT NULL,
	[SiteId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Quantity] [decimal](20, 8) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[InputPrice] [decimal](20, 8) NULL,
	[Supplier] [nvarchar](128) NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_MedicineInput] PRIMARY KEY CLUSTERED 
(
	[MedicineInputId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[procGetOrganisationIdForUser]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procGetOrganisationIdForUser]
(
@UserID uniqueidentifier
)
AS
BEGIN
SET NOCOUNT ON

SELECT OrganisationID
FROM aspnet_Users
WHERE UserId = @UserID

-- =================================================================================
-- Change History
-- =================================================================================
-- 14-Dec-2011 HT
-- use aspnet_Users to get Organisation

END
GO
/****** Object:  StoredProcedure [dbo].[procGetOrganisationByAuthorisationCode]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procGetOrganisationByAuthorisationCode]

@AuthorisationCode varchar (128)

AS
BEGIN

SET NOCOUNT ON

SELECT
OrganisationID,
O.Name,
ContactInformationID,
DisplayIndex,
IsLegacy,
AuthorisationCode,
Concurrency,
DateCreated,
DateUpdated,
CreatedBy,
UpdatedBy,
(CASE WHEN
(SELECT TOP 1 S.OrganisationID FROM Site S WHERE S.OrganisationID = O.OrganisationID) IS NOT NULL THEN 0
ELSE 1 END) As CanDelete
FROM
dbo.Organisation AS O
WHERE
AuthorisationCode = @AuthorisationCode

-- ======================================================================
-- Change History
-- ======================================================================
-- 23-Feb-2014 HT
-- INIT

END
GO
/****** Object:  StoredProcedure [dbo].[procGetOrganisation]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procGetOrganisation]
@OrganisationID int
AS
BEGIN

SET NOCOUNT ON

SELECT
OrganisationID,
O.Name,
ContactInformationID,
DisplayIndex,
IsLegacy,
AuthorisationCode,
Concurrency,
DateCreated,
DateUpdated,
CreatedBy,
UpdatedBy,
(CASE WHEN
(SELECT TOP 1 S.OrganisationID FROM Site S WHERE S.OrganisationID = O.OrganisationID) IS NOT NULL THEN 0
ELSE 1 END) As CanDelete

FROM
dbo.Organisation AS O
WHERE
OrganisationID = @OrganisationID

-- ======================================================================
-- Change History
-- ======================================================================
-- 24-Feb-2014 HT
-- INIT
END
GO
/****** Object:  StoredProcedure [dbo].[procListContactInformation]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListContactInformation] (
@ContactInformationId int = NULL
)

AS
BEGIN
	SET NOCOUNT ON

	SELECT ContactInformationID, ContactTypeId, FirstName, LastName, Address, Address2, District, DistrictId, City, CityId, State, Postcode, CountryId,
		PhoneNumber, FaxNumber, Email, DoB, Visa, VisaValidFrom, VisaValidTo,
		Concurrency, DateCreated, DateUpdated, CreatedBy, UpdatedBy
	FROM ContactInformation
	WHERE (@ContactInformationID IS NULL OR ContactInformationId = @ContactInformationId)
END
GO
/****** Object:  StoredProcedure [dbo].[procListCity]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListCity] 
(
	@CountryId int = NULL
	, @CityId int = NULL
)

AS
BEGIN
	SET NOCOUNT ON

	SELECT CityID, CountryId, Name, Concurrency, DateCreated, DateUpdated, CreatedBy, UpdatedBy
	FROM City
	WHERE (@CountryId IS NULL OR CountryId = @CountryId)
	AND (@CityID IS NULL OR CityId = @CityId)
END
GO
/****** Object:  StoredProcedure [dbo].[procDeleteCustomer]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procDeleteCustomer](@CustomerId int)	
AS
BEGIN
SET NOCOUNT ON

DELETE Customer WHERE CustomerId = @CustomerId
END
GO
/****** Object:  StoredProcedure [dbo].[procDeleteContactInformation]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procDeleteContactInformation](@ContactInformationId int)	
AS
BEGIN
SET NOCOUNT ON

DELETE ContactInformation WHERE ContactInformationId = @ContactInformationId
END
GO
/****** Object:  StoredProcedure [dbo].[procDeleteAspRole]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procDeleteAspRole]
(
@RoleId uniqueidentifier
)
AS
BEGIN
SET NOCOUNT ON

DELETE FROM aspnet_Roles WHERE RoleId = @RoleId

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId uniqueidentifier,
    @UserName nvarchar(256),
    @IsUserAnonymous bit,
    @LastActivityDate DATETIME,
    @UserId uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[procDeleteImage]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procDeleteImage](@ImageId int)	
AS
BEGIN
SET NOCOUNT ON

DELETE Image WHERE ImageId = @ImageId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName nvarchar(256),
    @RoleName nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL

    DECLARE @ErrorCode int
    SET @ErrorCode = 0

    DECLARE @TranStarted bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationID] [int] NOT NULL,
	[SiteID] [int] NULL,
	[FirstName] [nvarchar](128) NOT NULL,
	[LastName] [nvarchar](128) NOT NULL,
	[IsLegacy] [bit] NOT NULL,
	[Gender] [int] NULL,
	[DoB] [smalldatetime] NULL,
	[Position] [nvarchar](128) NOT NULL,
	[ContactInformationId] [int] NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[District]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[District](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Concurrency] [timestamp] NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateUpdated] [smalldatetime] NULL,
	[CreatedBy] [varchar](128) NULL,
	[UpdatedBy] [varchar](128) NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Treatment]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Treatment](
	[TreatmentId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Description] [varchar](max) NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[SiteId] [int] NULL,
 CONSTRAINT [PK_RoomService] PRIMARY KEY CLUSTERED 
(
	[TreatmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[procListOrganisation]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListOrganisation]

AS
BEGIN
SET NOCOUNT ON

SELECT
OrganisationID,
O.Name,
ContactInformationID,
DisplayIndex,
IsLegacy,
AuthorisationCode,
Concurrency,
DateCreated,
DateUpdated,
CreatedBy,
UpdatedBy,
(CASE WHEN
(SELECT TOP 1 S.OrganisationID FROM Site S WHERE S.OrganisationID = O.OrganisationID) IS NOT NULL THEN 0
ELSE 1 END) As CanDelete	
FROM
dbo.Organisation AS O
-- ======================================================================
-- Change History
-- ======================================================================
-- 23-Feb-2014 HT
-- INIT
END
GO
/****** Object:  StoredProcedure [dbo].[procSaveMedicine]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveMedicine]

@MedicineId int OUTPUT,
@OrganisationId int,
@Name nvarchar(50),
@Description nvarchar(128),
@IsLegacy bit,
@Price decimal(20,8),
@InputPrice decimal(20,8),
@Unit nvarchar(50),
@CurrentUser varchar(128)
AS
BEGIN
SET NOCOUNT ON

	IF @MedicineID IS NULL BEGIN

	INSERT INTO Medicine(
		OrganisationId,
		Name,
		Description,
		IsLegacy,
		Price,
		InputPrice,
		Unit,
		DateCreated,
		DateUpdated,
		CreatedBy,
		UpdatedBy
	) VALUES (
		@OrganisationId,
		@Name ,
		@Description,
		@IsLegacy,
		@Price,
		@InputPrice,
		@Unit,
		GETDATE(),
		GETDATE(),
		@CurrentUser,
		@CurrentUser
	)

	SET @MedicineId = SCOPE_IDENTITY()

	END ELSE BEGIN

	UPDATE Medicine SET
		OrganisationId = @OrganisationId,
		Name = @Name ,
		Description = @Description,
		IsLegacy = @IsLegacy,
		Price = @Price,
		InputPrice = @InputPrice,
		Unit = @Unit,
		DateUpdated = GETDATE(),
		UpdatedBy = @CurrentUser

	WHERE MedicineId = @MedicineId

END

SELECT Concurrency FROM Medicine WHERE MedicineId = @MedicineId
END
GO
/****** Object:  StoredProcedure [dbo].[procSaveImage]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveImage]

@ImageID int OUTPUT,
@ImageTypeId int,
@ItemId int,
@FileName varchar(128),
@ImageContent varbinary(MAX),
@ImageSmallContent varbinary(MAX),
@DisplayIndex int,
@Description varchar(max),
@CurrentUser varchar(128)
AS

SET NOCOUNT ON
BEGIN
IF (NOT EXISTS (SELECT * FROM Image WHERE ImageID = @ImageID)) BEGIN

INSERT INTO Image(
ImageTypeId
,ItemId
,[FileName]
,[ImageContent]
,[ImageSmallContent]
,[DisplayIndex]
,[Description]
,[DateCreated]
,[DateUpdated]
,[CreatedBy]
,[UpdatedBy]
) VALUES (
@ImageTypeId
,@ItemId
,@FileName
,@ImageContent
,@ImageSmallContent
,@DisplayIndex
,@Description
,GETDATE()
,GETDATE()
,@CurrentUser
,@CurrentUser
)

SET @ImageID = SCOPE_IDENTITY()

END ELSE BEGIN

UPDATE Image SET

ImageTypeId = @ImageTypeId
,ItemId = @ItemId
,[FileName] = @FileName
,[ImageContent] = @ImageContent	
,[ImageSmallContent] = @ImageSmallContent
,[DisplayIndex] = @DisplayIndex
,[Description] = @Description
,DateUpdated = GETDATE()
,UpdatedBy = @CurrentUser

WHERE (ImageId = @ImageID)

END

SELECT Concurrency FROM Image WHERE ImageId = @ImageID
END
GO
/****** Object:  StoredProcedure [dbo].[procSaveSite]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object: StoredProcedure [dbo].[procSaveSite1] Script Date: 04/03/2012 14:43:56 ******/
CREATE PROCEDURE [dbo].[procSaveSite]
@SiteID int OUTPUT,
@OrganisationID int,
@Name nvarchar(128),
@AbbreviatedName varchar (10),
@ContactInformationID int,
@LicenseKey uniqueidentifier,
@PropCode varchar (50),
@DisplayIndex int,
@IsLegacy bit,
@Availability int,
@CurrentUser varchar(128)
AS
BEGIN
SET NOCOUNT ON

IF @SiteID IS NULL BEGIN

INSERT INTO Site(
OrganisationID,
Name,
AbbreviatedName,
ContactInformationID,
LicenseKey,
PropCode,
DisplayIndex,
IsLegacy,
Availability,
DateCreated,
DateUpdated,
CreatedBy,
UpdatedBy
) VALUES (
@OrganisationID,
@Name,
@AbbreviatedName,
@ContactInformationID,
@LicenseKey,
@PropCode,
@DisplayIndex,
@IsLegacy,
@Availability,
GETDATE(),
GETDATE(),
@CurrentUser,
@CurrentUser
)
SET @SiteID = SCOPE_IDENTITY()

END ELSE BEGIN

UPDATE Site SET

OrganisationID = @OrganisationID ,
Name = @Name ,
AbbreviatedName = @AbbreviatedName,
ContactInformationID = @ContactInformationID,
LicenseKey = @LicenseKey,
PropCode = @PropCode,
DisplayIndex = @DisplayIndex,
IsLegacy = @IsLegacy,
Availability = @Availability,
DateUpdated = GETDATE(),
UpdatedBy = @CurrentUser

WHERE SiteID = @SiteID

END

SELECT Concurrency FROM Site WHERE SiteID = @SiteID

-- ======================================================================
-- Change History
-- ======================================================================
-- 27-Feb-2014 HT
-- INIT
END
GO
/****** Object:  StoredProcedure [dbo].[procSaveService]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveService]

@ServiceId int OUTPUT,
@OrganisationId int,
@Name nvarchar(50),
@Description nvarchar(128),
@IsLegacy bit,
@Price decimal(20,8),
@Unit nvarchar(50),
@CurrentUser varchar(128)
AS
BEGIN
SET NOCOUNT ON

	IF @ServiceID IS NULL BEGIN

	INSERT INTO Service(
		OrganisationId,
		Name ,
		Description,
		IsLegacy,
		Price,
		Unit,
		DateCreated,
		DateUpdated,
		CreatedBy,
		UpdatedBy
	) VALUES (
		@OrganisationId,
		@Name ,
		@Description,
		@IsLegacy,
		@Price,
		@Unit,
		GETDATE(),
		GETDATE(),
		@CurrentUser,
		@CurrentUser
	)

	SET @ServiceId = SCOPE_IDENTITY()

	END ELSE BEGIN

	UPDATE Service SET
		OrganisationId = @OrganisationId,
		Name = @Name ,	
		Description = @Description,
		IsLegacy = @IsLegacy,
		Price = @Price,
		Unit = @Unit,
		DateUpdated = GETDATE(),
		UpdatedBy = @CurrentUser

	WHERE ServiceId = @ServiceId

END

SELECT Concurrency FROM Service WHERE ServiceId = @ServiceId
END
GO
/****** Object:  Table [dbo].[RoleComponentPermission]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleComponentPermission](
	[RoleComponentPermissionId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[ComponentId] [int] NOT NULL,
	[WriteRight] [bit] NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_RoleComponentPermission] PRIMARY KEY CLUSTERED 
(
	[RoleComponentPermissionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[procUpdateAspUserOrganisationId]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procUpdateAspUserOrganisationId]	
	@UserID uniqueidentifier
	, @OrganisationId int = null		
AS
BEGIN
	UPDATE aspnet_Users SET OrganisationId = @OrganisationId
	WHERE UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[procSearchCustomer]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSearchCustomer]
(
@CustomerId int = NULL
, @SearchWord varchar(128)
, @ShowLegacy bit
)
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

SELECT
C.[CustomerId]
, C.OrganisationID
, C.SiteID
, C.[FirstName]
, C.[LastName]
, C.[IsLegacy]
, C.[Gender]
, C.[DoB]
, C.[ContactInformationId]
, C.IsLegacy
, I.[Address]
, I.[Address2]
, I.[District]
, I.[City]
, I.[State]
, I.[Postcode]
, I.[Country]
, I.[PhoneNumber]
, I.[FaxNumber]
, I.[Email]
, C.Concurrency
, C.DateCreated
, C.DateUpdated
, C.CreatedBy
, C.UpdatedBy
FROM
Customer AS C	
LEFT OUTER JOIN ContactInformation I on C.ContactInformationId = I.ContactInformationId
WHERE
(@CustomerId IS NULL OR C.CustomerID = @CustomerId)
AND (C.IsLegacy = 0 OR @ShowLegacy = 1)
--AND (CONTAINS(C.FirstName, @SearchWord)
-- OR CONTAINS(C.LastName, @SearchWord)
-- OR CONTAINS(I.FirstName, @SearchWord)
-- OR CONTAINS(I.LastName, @SearchWord)
-- OR CONTAINS(I.Address, @SearchWord)
-- OR CONTAINS(I.Address2, @SearchWord)
-- OR CONTAINS(I.City, @SearchWord)
-- OR CONTAINS(I.State, @SearchWord)
-- OR CONTAINS(I.Postcode, @SearchWord)
-- OR CONTAINS(CT.Name, @SearchWord)
-- OR CONTAINS(I.[Email], @SearchWord)
-- OR CONTAINS(I.PhoneNumber, @SearchWord)
-- OR CONTAINS(I.FaxNumber, @SearchWord)
--)

ORDER BY
C.FirstName, C.LastName, C.DateCreated DESC
END
GO
/****** Object:  StoredProcedure [dbo].[procSaveCustomer]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveCustomer]
(
 @CustomerID int OUTPUT
, @OrganisationId int
, @FirstName nvarchar(128)
, @LastName nvarchar(128)
, @IsLegacy bit
, @Gender int = NULL
, @Dob smalldatetime = NULL
, @ContactInformationId int = NULL
, @CurrentUser varchar(128)
)
AS
BEGIN

	SET NOCOUNT ON

	IF @CustomerID IS NULL
	BEGIN

		INSERT INTO [Customer]
		(
		[OrganisationId]
		, [FirstName]
		, [LastName]
		, [IsLegacy]
		, [Gender]
		, [DoB]	
		, [ContactInformationId]	
		, [DateCreated]
		, [DateUpdated]
		, [CreatedBy]
		, [UpdatedBy]
		)
		VALUES
		(
		@OrganisationId
		, @FirstName
		, @LastName
		, @IsLegacy
		, @Gender
		, @DoB
		, @ContactInformationId
		, GETDATE()
		, GETDATE()
		, @CurrentUser
		, @CurrentUser
		)

		SET @CustomerID = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN

		UPDATE
		[Customer]
		SET
		[OrganisationId] = @OrganisationId
		, [FirstName] = @FirstName
		, LastName = @LastName
		, IsLegacy = @IsLegacy
		, Gender = @Gender
		, DoB = @DoB
		, ContactInformationId = @ContactInformationId
		, [DateUpdated] = GETDATE()
		, [UpdatedBy] = @CurrentUser
		WHERE
		[CustomerID] = @CustomerID

	END

	SELECT [Concurrency] FROM [Customer] WHERE [CustomerID] = @CustomerID

END
GO
/****** Object:  StoredProcedure [dbo].[procSaveContactInformation]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveContactInformation]

@ContactInformationID int OUTPUT
,@ContactTypeId int
,@FirstName nvarchar(128)
,@LastName nvarchar(128)
,@Address nvarchar(255)
,@Address2 nvarchar(255)
,@District varchar(255)
,@DistrictId int
,@City varchar(255)
,@CityId int
,@State varchar(255)
,@Postcode varchar(255)
,@CountryId int
,@PhoneNumber varchar(128)
,@FaxNumber varchar(128)
,@Email varchar(255)
,@DoB datetime
,@Visa varchar(128)
,@VisaValidFrom datetime
,@VisaValidTo datetime
,@CurrentUser varchar(255)
AS
BEGIN
	SET NOCOUNT ON

	IF @ContactInformationID IS NULL BEGIN

	INSERT INTO ContactInformation(
			[ContactTypeId]
			,[FirstName]
			,[LastName]
			,[Address]
			,[Address2]
			,[District]
			,[DistrictId]
			,[City]
			,[CityId]
			,[State]
			,[Postcode]
			,[CountryId]
			,[PhoneNumber]
			,[FaxNumber]
			,[Email]
			,DoB
			,Visa
			,VisaValidFrom
			,VisaValidTo
			,DateCreated
			,DateUpdated
			,CreatedBy
			,UpdatedBy
		) VALUES (
			@ContactTypeId
			,@FirstName
			,@LastName
			,@Address
			,@Address2
			,@District
			,@DistrictId
			,@City
			,@CityId
			,@State
			,@Postcode
			,@CountryId
			,@PhoneNumber
			,@FaxNumber
			,@Email
			,@DoB
			,@Visa
			,@VisaValidFrom
			,@VisaValidTo
			,GETDATE()
			,GETDATE()
			,@CurrentUser
			,@CurrentUser
		)

		SET @ContactInformationID = SCOPE_IDENTITY()

	END ELSE BEGIN

		UPDATE ContactInformation SET
			ContactTypeId = @ContactTypeId,
			FirstName = @FirstName,
			LastName = @LastName,
			Address = @Address,
			Address2 = @Address2 ,
			District = @District,
			DistrictId = @DistrictId,
			City = @City ,
			CityId = @CityId ,
			State = @State ,
			Postcode = @Postcode ,
			CountryID = @CountryID ,
			PhoneNumber = @PhoneNumber ,
			FaxNumber = @FaxNumber ,
			Email = @Email,
			DoB = @DoB,
			Visa = @Visa,
			VisaValidFrom = @VisaValidFrom,
			VisaValidTo = @VisaValidTo,
			DateUpdated = GETDATE(),
			UpdatedBy = @CurrentUser

		WHERE ContactInformationID = @ContactInformationID

	END

	SELECT Concurrency FROM ContactInformation WHERE ContactInformationID = @ContactInformationID
END
GO
/****** Object:  StoredProcedure [dbo].[procSaveAspRole]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveAspRole]	
@ApplicationName nvarchar(256),	
@RoleId uniqueidentifier,
@RoleName nvarchar(256),
@LoweredRoleName nvarchar(256),
@Description nvarchar(256),
@CurrentUser varchar(128)
AS
BEGIN
SET NOCOUNT ON
DECLARE @ApplicationId uniqueidentifier
SELECT	@ApplicationId = ApplicationId
FROM	aspnet_Applications
WHERE	LoweredApplicationName = LOWER(@ApplicationName)

IF (@RoleId IS NULL OR @RoleId = '00000000-0000-0000-0000-000000000000') BEGIN	
INSERT INTO aspnet_Roles(
ApplicationId,
RoleId,
RoleName,
LoweredRoleName,
Description
) VALUES (
@ApplicationId,
newid(),
@RoleName,
@LoweredRoleName,
@Description
)	

END ELSE BEGIN

UPDATE aspnet_Roles SET
ApplicationId = @ApplicationId,
RoleId = @RoleId,
RoleName = @RoleName,
LoweredRoleName = @LoweredRoleName,
Description = @Description

WHERE RoleId = @RoleId

END

END
GO
/****** Object:  StoredProcedure [dbo].[procListMedicine]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListMedicine]	
@OrganisationId int = null,
@MedicineId int = null,
@ShowLegacy bit
AS
BEGIN
SET NOCOUNT ON

SELECT	RE.MedicineId, RE.OrganisationId, RE.Name,
RE.IsLegacy, RE.Description, RE.Price, RE.InputPrice, RE.Unit,
RE.Concurrency, RE.DateCreated, RE.DateUpdated, RE.CreatedBy, RE.UpdatedBy
FROM	Medicine RE
WHERE	(@MedicineId is null OR RE.MedicineId = @MedicineId)
AND	(@OrganisationId is null OR RE.OrganisationId = @OrganisationId)
AND	(@ShowLegacy = 1 OR RE.IsLegacy = 0)

END
GO
/****** Object:  StoredProcedure [dbo].[procListImage]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListImage]
(
@ImageId int = NULL
,@ItemId int = NULL
,@ImageTypeId int = NULL
,@LoadType int -- 0 : no content, 1 : load big contect, 2 : load small conten, 3 : load all
)

AS
BEGIN
SET NOCOUNT ON

SELECT ImageID, ImageTypeId, ItemId, FileName,
CASE WHEN (@LoadType = 1 OR @LoadType = 3) THEN I.ImageContent ELSE NULL END AS ImageContent,
CASE WHEN (@LoadType = 2 OR @LoadType = 3) THEN I.ImageSmallContent ELSE NULL END AS ImageSmallContent,
DisplayIndex, Description,
Concurrency, DateCreated, DateUpdated, CreatedBy, UpdatedBy
FROM dbo.[Image] I
WHERE (@ImageID IS NULL OR ImageId = @ImageId)
AND	(@ItemId IS NULL OR ItemId = @ItemId)
AND (@ImageTypeId IS NULL OR ImageTypeId = @ImageTypeId)
END
GO
/****** Object:  StoredProcedure [dbo].[procListSite]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListSite]
(
@OrganisationID int = null
, @SiteID int = null
, @ShowLegacy bit = null
)
AS
BEGIN
SET NOCOUNT ON

SELECT [SiteID]
,[OrganisationID]
,[Name]
,[AbbreviatedName]
,[ContactInformationID]
,[LicenseKey]
,[PropCode]
,[DisplayIndex]
,[IsLegacy]
,[Availability]
,[Concurrency]
,[DateCreated]
,[DateUpdated]
,[CreatedBy]
,[UpdatedBy]
FROM dbo.Site AS S
WHERE
(@OrganisationID IS NULL OR @OrganisationID = S.OrganisationID)
AND (@SiteID IS NULL OR @SiteID = S.OrganisationID)
AND	(@ShowLegacy = 1 OR S.IsLegacy = 0)
ORDER BY DisplayIndex	

-- ======================================================================
-- Change History
-- ======================================================================
-- 21-Feb-2014 HT
-- INIT
END
GO
/****** Object:  StoredProcedure [dbo].[procListService]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListService]	
@OrganisationId int = null,
@ServiceId int = null,
@ShowLegacy bit
AS
BEGIN
SET NOCOUNT ON

SELECT	RE.ServiceId, RE.OrganisationId, RE.Name,
RE.IsLegacy, RE.Description, RE.Price, RE.Unit,
RE.Concurrency, RE.DateCreated, RE.DateUpdated, RE.CreatedBy, RE.UpdatedBy
FROM	Service RE
WHERE	(@ServiceId is null OR RE.ServiceId = @ServiceId)
AND	(@OrganisationId is null OR RE.OrganisationId = @OrganisationId)
AND	(@ShowLegacy = 1 OR RE.IsLegacy = 0)

END
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership] 
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName nvarchar(256),
    @RoleName nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL
    SELECT @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL
    SELECT @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleAuth]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRoleAuth](
	[UserRoleAuthId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[WholeOrg] [bit] NULL,
	[SiteId] [int] NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_UserRoleAuth] PRIMARY KEY CLUSTERED 
(
	[UserRoleAuthId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  StoredProcedure [dbo].[procSaveTreatment]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveTreatment]

@TreatmentId int OUTPUT,
@SiteId int,
@CustomerId int,
@DoctorId int,
@Date smalldatetime,
@Description nvarchar(128),
@CurrentUser varchar(128)
AS
BEGIN
SET NOCOUNT ON

	IF @TreatmentID IS NULL BEGIN

	INSERT INTO Treatment(
		SiteId,
		CustomerId,
		DoctorId,
		Date,
		Description,
		DateCreated,
		DateUpdated,
		CreatedBy,
		UpdatedBy
	) VALUES (
		@SiteId,
		@CustomerId,
		@DoctorId,
		@Date ,
		@Description,
		GETDATE(),
		GETDATE(),
		@CurrentUser,
		@CurrentUser
	)

	SET @TreatmentId = SCOPE_IDENTITY()

	END ELSE BEGIN

	UPDATE Treatment SET
		SiteId = @SiteId,
		CustomerId = @CustomerId,
		DoctorId = @DoctorId,
		Date = @Date ,
		Description = @Description,
		DateUpdated = GETDATE(),
		UpdatedBy = @CurrentUser

	WHERE TreatmentId = @TreatmentId

END

SELECT Concurrency FROM Treatment WHERE TreatmentId = @TreatmentId
END
GO
/****** Object:  StoredProcedure [dbo].[procListAspRole]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListAspRole]	
@RoleId uniqueidentifier = null
AS
BEGIN
SET NOCOUNT ON

SELECT	R.ApplicationId, R.RoleId, R.RoleName, R.LoweredRoleName, R.Description,
(CASE WHEN
(SELECT TOP 1 RCP.RoleId FROM RoleComponentPermission RCP WHERE RCP.RoleId = R.RoleId) IS NOT NULL THEN 0
WHEN
(SELECT TOP 1 URA.RoleId FROM UserRoleAuth URA WHERE URA.RoleId = R.RoleId) IS NOT NULL THEN 0	
ELSE 1 END) as CanDelete	
FROM	aspnet_Roles R	
WHERE	(@RoleId is null OR R.RoleId = @RoleId)

END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnUserRoleMinLevel]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnUserRoleMinLevel]
(
@UserId uniqueidentifier
)
RETURNS int
AS
BEGIN
DECLARE @Result int

SELECT @Result = min(RoleRank)
FROM
(SELECT [dbo].[ufnGetRoleRank](RoleID) AS RoleRank	
FROM UserRoleAuth
WHERE UserId = @UserId
) A

IF(@Result is null)
SELECT @Result = 1000

RETURN @Result

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT @UserId = NULL
    SELECT @NumTablesDeletedFrom = 0

    DECLARE @TranStarted bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
BEGIN TRANSACTION
SET @TranStarted = 1
    END
    ELSE
SET @TranStarted = 0

    DECLARE @ErrorCode int
    DECLARE @RowCount int

    SET @ErrorCode = 0
    SET @RowCount = 0

    SELECT @UserId = u.UserId
    FROM dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE u.LoweredUserName = LOWER(@UserName)
        AND u.ApplicationId = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
SET @TranStarted = 0
COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName nvarchar(256),
    @RoleName nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL
    SELECT @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode int
    SET @ErrorCode = 0

    DECLARE @TranStarted bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId uniqueidentifier
    SELECT @RoleId = NULL
    SELECT @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserName_Custom]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserName_Custom]
@ApplicationName	nvarchar(256),
@UserName	nvarchar(256),
@NewUserName	nvarchar(256)
AS
BEGIN
DECLARE @UserId uniqueidentifier
DECLARE @ApplicationId uniqueidentifier
DECLARE @NewLoweredUserName nvarchar(256)
DECLARE @LastActivityDate datetime

SELECT @UserId = NULL
SELECT @UserId = u.UserId, @ApplicationId = a.ApplicationId
FROM dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
WHERE LoweredUserName = LOWER(@UserName) AND
u.ApplicationId = a.ApplicationId AND
LOWER(@ApplicationName) = a.LoweredApplicationName AND
u.UserId = m.UserId

IF (@UserId IS NULL)
BEGIN
SELECT 1
RETURN
END

SET @LastActivityDate = (getdate())
SET @NewLoweredUserName = LOWER(@NewUserName)

DECLARE @TranStarted bit
SET @TranStarted = 0

IF( @@TRANCOUNT = 0 )
BEGIN
BEGIN TRANSACTION
SET @TranStarted = 1
END
ELSE
SET @TranStarted = 0

UPDATE dbo.aspnet_Users WITH (ROWLOCK)
SET
UserName = @NewUserName,
LoweredUserName = @NewLoweredUserName,
LastActivityDate = @LastActivityDate
WHERE
@UserId = UserId

IF( @@ERROR <> 0 )
GOTO Cleanup

IF( @TranStarted = 1 )
BEGIN
SET @TranStarted = 0
COMMIT TRANSACTION
END

SELECT 0
RETURN

Cleanup:

IF( @TranStarted = 1 )
BEGIN
SET @TranStarted = 0
ROLLBACK TRANSACTION
END

SELECT -1
RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @IsPasswordCorrect bit,
    @UpdateLastLoginActivityDate bit,
    @MaxInvalidPasswordAttempts int,
    @PasswordAttemptWindow int,
    @CurrentTimeUtc datetime,
    @LastLoginDate datetime,
    @LastActivityDate datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @IsApproved bit
    DECLARE @IsLockedOut bit
    DECLARE @LastLockoutDate datetime
    DECLARE @FailedPasswordAttemptCount int
    DECLARE @FailedPasswordAttemptWindowStart datetime
    DECLARE @FailedPasswordAnswerAttemptCount int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode int
    SET @ErrorCode = 0

    DECLARE @TranStarted bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
BEGIN TRANSACTION
SET @TranStarted = 1
    END
    ELSE
     SET @TranStarted = 0

    SELECT @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE dbo.aspnet_Users
        SET LastActivityDate = @LastActivityDate
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE dbo.aspnet_Membership
        SET LastLoginDate = @LastLoginDate
        WHERE UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
SET @TranStarted = 0
COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
     ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @Email nvarchar(256),
    @Comment ntext,
    @IsApproved bit,
    @LastLoginDate datetime,
    @LastActivityDate datetime,
    @UniqueEmail int,
    @CurrentTimeUtc datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT @UserId = NULL
    SELECT @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
BEGIN TRANSACTION
SET @TranStarted = 1
    END
    ELSE
SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email = @Email,
         LoweredEmail = LOWER(@Email),
         Comment = @Comment,
         IsApproved = @IsApproved,
         LastLoginDate = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
SET @TranStarted = 0
COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
     ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT @UserId = NULL
    SELECT @UserId = u.UserId
    FROM dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @NewPassword nvarchar(128),
    @PasswordSalt nvarchar(128),
    @CurrentTimeUtc datetime,
    @PasswordFormat int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT @UserId = NULL
    SELECT @UserId = u.UserId
    FROM dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @NewPassword nvarchar(128),
    @MaxInvalidPasswordAttempts int,
    @PasswordAttemptWindow int,
    @PasswordSalt nvarchar(128),
    @CurrentTimeUtc datetime,
    @PasswordFormat int = 0,
    @PasswordAnswer nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut bit
    DECLARE @LastLockoutDate datetime
    DECLARE @FailedPasswordAttemptCount int
    DECLARE @FailedPasswordAttemptWindowStart datetime
    DECLARE @FailedPasswordAnswerAttemptCount int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId uniqueidentifier
    SET @UserId = NULL

    DECLARE @ErrorCode int
    SET @ErrorCode = 0

    DECLARE @TranStarted bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
BEGIN TRANSACTION
SET @TranStarted = 1
    END
    ELSE
     SET @TranStarted = 0

    SELECT @UserId = u.UserId
    FROM dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
SET @TranStarted = 0
COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
     ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId uniqueidentifier,
    @CurrentTimeUtc datetime,
    @UpdateLastActivity bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE dbo.aspnet_Users
        SET LastActivityDate = @CurrentTimeUtc
        FROM dbo.aspnet_Users
        WHERE @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @CurrentTimeUtc datetime,
    @UpdateLastActivity bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE dbo.aspnet_Users
        SET LastActivityDate = @CurrentTimeUtc
        WHERE @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE @UserId = u.UserId AND u.UserId = m.UserId
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName nvarchar(256),
    @Email nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT u.UserName
        FROM dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT u.UserName
        FROM dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @UpdateLastLoginActivityDate bit,
    @CurrentTimeUtc datetime
AS
BEGIN
    DECLARE @IsLockedOut bit
    DECLARE @UserId uniqueidentifier
    DECLARE @Password nvarchar(128)
    DECLARE @PasswordSalt nvarchar(128)
    DECLARE @PasswordFormat int
    DECLARE @FailedPasswordAttemptCount int
    DECLARE @FailedPasswordAnswerAttemptCount int
    DECLARE @IsApproved bit
    DECLARE @LastActivityDate datetime
    DECLARE @LastLoginDate datetime

    SELECT @UserId = NULL

    SELECT @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
@FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET LastLoginDate = @CurrentTimeUtc
        WHERE UserId = @UserId

        UPDATE dbo.aspnet_Users
        SET LastActivityDate = @CurrentTimeUtc
        WHERE @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @MaxInvalidPasswordAttempts int,
    @PasswordAttemptWindow int,
    @CurrentTimeUtc datetime,
    @PasswordAnswer nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @PasswordFormat int
    DECLARE @Password nvarchar(128)
    DECLARE @passAns nvarchar(128)
    DECLARE @IsLockedOut bit
    DECLARE @LastLockoutDate datetime
    DECLARE @FailedPasswordAttemptCount int
    DECLARE @FailedPasswordAttemptWindowStart datetime
    DECLARE @FailedPasswordAnswerAttemptCount int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode int
    SET @ErrorCode = 0

    DECLARE @TranStarted bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
BEGIN TRANSACTION
SET @TranStarted = 1
    END
    ELSE
     SET @TranStarted = 0

    SELECT @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
SET @TranStarted = 0
COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
     ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName nvarchar(256),
    @MinutesSinceLastInActive int,
    @CurrentTimeUtc datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT @DateActive = DATEADD(minute, -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT @NumOnline = COUNT(*)
    FROM dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE u.ApplicationId = a.ApplicationId AND
            LastActivityDate > @DateActive AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName nvarchar(256),
    @PageIndex int,
    @PageSize int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName nvarchar(256),
    @UserNameToMatch nvarchar(256),
    @PageIndex int,
    @PageSize int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT @TotalRecords = COUNT(*)
    FROM #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName nvarchar(256),
    @EmailToMatch nvarchar(256),
    @PageIndex int,
    @PageSize int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT @TotalRecords = COUNT(*)
    FROM #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @Password nvarchar(128),
    @PasswordSalt nvarchar(128),
    @Email nvarchar(256),
    @PasswordQuestion nvarchar(256),
    @PasswordAnswer nvarchar(128),
    @IsApproved bit,
    @CurrentTimeUtc datetime,
    @CreateDate datetime = NULL,
    @UniqueEmail int = 0,
    @PasswordFormat int = 0,
    @UserId uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue int
    SET @ReturnValue = 0

    DECLARE @ErrorCode int
    SET @ErrorCode = 0

    DECLARE @TranStarted bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
BEGIN TRANSACTION
SET @TranStarted = 1
    END
    ELSE
     SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM dbo.aspnet_Membership
                  WHERE @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET LastActivityDate = @CreateDate
        WHERE @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
SET @TranStarted = 0
COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
     ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @NewPasswordQuestion nvarchar(256),
    @NewPasswordAnswer nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT @UserId = NULL
    SELECT @UserId = u.UserId
    FROM dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END


    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[procListRoleComponentPermissionByUser]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListRoleComponentPermissionByUser]	
@UserId uniqueidentifier = null
AS
BEGIN
SET NOCOUNT ON

SELECT distinct	RCP.RoleComponentPermissionId, RCP.RoleId, R.RoleName, RCP.ComponentId,
C.Name as ComponentName, RCP.WriteRight,
RCP.Concurrency, RCP.DateCreated, RCP.DateUpdated, RCP.CreatedBy, RCP.UpdatedBy
FROM	RoleComponentPermission RCP
INNER JOIN Component C on RCP.ComponentId = C.ComponentId
INNER JOIN aspnet_Roles R on R.RoleId = RCP.RoleId
INNER JOIN UserRoleAuth URA on R.RoleId = RCP.RoleId
WHERE	(@UserId is null OR URA.UserId = @UserId)

END
GO
/****** Object:  StoredProcedure [dbo].[procListRoleComponentPermission]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListRoleComponentPermission]	
@RoleId uniqueidentifier = null
, @ComponentId int = null
AS
BEGIN
SET NOCOUNT ON

SELECT	RCP.RoleComponentPermissionId, RCP.RoleId, R.RoleName, RCP.ComponentId,
C.Name as ComponentName, RCP.WriteRight,
RCP.Concurrency, RCP.DateCreated, RCP.DateUpdated, RCP.CreatedBy, RCP.UpdatedBy
FROM	RoleComponentPermission RCP
INNER JOIN Component C on RCP.ComponentId = C.ComponentId
INNER JOIN aspnet_Roles R on R.RoleId = RCP.RoleId
WHERE	(@RoleId is null OR RCP.RoleId = @RoleId)
AND	(@ComponentId is null OR C.ComponentId = @ComponentId)

END
GO
/****** Object:  StoredProcedure [dbo].[procListDoctor]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListDoctor]	
@OrganisationId int = null
, @SiteId int
, @DoctorId int = null
, @FirstName varchar(125)
, @LastName varchar(125)
, @ShowLegacy bit
AS
BEGIN
	SET NOCOUNT ON
	
		SELECT top 1000	
			C.DoctorID
			, C.OrganisationId
			, C.SiteID
			, S.Name as SiteName
			, C.[FirstName]
			, C.[LastName]
			, C.[IsLegacy]
			, C.[Gender]
			, C.DoB	
			, C.Position
			, C.[ContactInformationId]
			, C.Concurrency, C.DateCreated, C.DateUpdated, C.CreatedBy, C.UpdatedBy
		FROM	Doctor C
		INNER JOIN Site S on S.SiteID = C.SiteId	
		WHERE	(@OrganisationId IS NULL OR C.OrganisationId = @OrganisationId)
		AND (@DoctorId is null OR C.DoctorId = @DoctorId)
		AND	(@FirstName IS NULL OR C.FirstName like '%' + @FirstName + '%' OR C.LastName like '%' + @FirstName + '%')
		AND	(@LastName IS NULL OR C.LastName like '%' + @LastName + '%'OR C.FirstName like '%' + @LastName  + '%')
		AND (@ShowLegacy = 1 OR C.IsLegacy = 0)
		AND (@SiteId is null OR S.SiteId = @SiteId)
		ORDER BY C.[FirstName], C.[LastName]
	
	
	-- ======================================================================
	-- Change History
	-- ======================================================================
	-- 20-May-2014 HT
	-- Add OrganisationId
END
GO
/****** Object:  StoredProcedure [dbo].[procListDistrict]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListDistrict] 
(
	@CityId int = NULL
	, @DistrictId int = NULL
)

AS
BEGIN
	SET NOCOUNT ON

	SELECT DistrictID, CityId, Name, Concurrency, DateCreated, DateUpdated, CreatedBy, UpdatedBy
	FROM District
	WHERE (@CityId IS NULL OR CityId = @CityId)
	AND (@DistrictID IS NULL OR DistrictId = @DistrictId)
END
GO
/****** Object:  StoredProcedure [dbo].[procListCustomer]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListCustomer]	
@OrganisationId int = null
, @SiteId int
, @CustomerId int = null
, @FirstName varchar(125)
, @LastName varchar(125)
, @HasContracts bit
, @ContractDateStart smalldatetime = null
, @ContractDateEnd smalldatetime = null
, @ShowLegacy bit
AS
BEGIN
	SET NOCOUNT ON
	IF(@HasContracts = 1) 
	BEGIN
		SELECT top 1000	
			C.CustomerID
			, C.OrganisationId
			, T.SiteID
			, S.Name as SiteName
			, C.[FirstName]
			, C.[LastName]
			, C.[IsLegacy]
			, C.[Gender]
			, C.DoB	
			, C.[ContactInformationId]
			, C.Concurrency, C.DateCreated, C.DateUpdated, C.CreatedBy, C.UpdatedBy
		FROM	Customer C			
		INNER JOIN Treatment T on C.CustomerId = T.CustomerId
		INNER JOIN Site S on S.SiteID = T.SiteId
		WHERE	(@OrganisationId IS NULL OR C.OrganisationId = @OrganisationId)
		AND (@CustomerId is null OR C.CustomerId = @CustomerId)
		AND	(@FirstName IS NULL OR C.FirstName like '%' + @FirstName + '%' OR C.LastName like '%' + @FirstName + '%')
		AND	(@LastName IS NULL OR C.LastName like '%' + @LastName + '%'OR C.FirstName like '%' + @LastName  + '%')
		AND (@ShowLegacy = 1 OR C.IsLegacy = 0)
		AND (@SiteId is null OR S.SiteId = @SiteId)
		AND (@ContractDateStart IS NULL AND @ContractDateEnd IS NULL			 
			 OR @ContractDateStart IS NOT NULL AND @ContractDateEnd IS NULL AND T.Date >= @ContractDateStart
			 OR @ContractDateStart IS NULL AND @ContractDateEnd IS NOT NULL AND T.Date <= @ContractDateEnd
			 OR T.Date Between @ContractDateStart and @ContractDateEnd
			)				

		ORDER BY T.Date DESC, C.[FirstName], C.[LastName]
	END
	ELSE
	BEGIN
		SELECT top 1000	
			C.CustomerID
			, C.OrganisationId
			, NULL as SiteID
			, NULL as SiteName
			, C.[FirstName]
			, C.[LastName]
			, C.[IsLegacy]
			, C.[Gender]
			, C.DoB	
			, C.[ContactInformationId]
			, C.Concurrency, C.DateCreated, C.DateUpdated, C.CreatedBy, C.UpdatedBy
		FROM	Customer C	
		WHERE	(@OrganisationId IS NULL OR C.OrganisationId = @OrganisationId)
		AND (@CustomerId is null OR C.CustomerId = @CustomerId)
		AND	(@FirstName IS NULL OR C.FirstName like '%' + @FirstName + '%' OR C.LastName like '%' + @FirstName + '%')
		AND	(@LastName IS NULL OR C.LastName like '%' + @LastName + '%'OR C.FirstName like '%' + @LastName  + '%')
		AND (@ShowLegacy = 1 OR C.IsLegacy = 0)			

		ORDER BY C.DateUpdated DESC, C.[FirstName], C.[LastName]
	END
	
	-- ======================================================================
	-- Change History
	-- ======================================================================
	-- 20-May-2014 HT
	-- Add OrganisationId
END
GO
/****** Object:  StoredProcedure [dbo].[procListUserRoleAuth]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListUserRoleAuth]	
@OrganisationId int = null
, @UserId uniqueidentifier = null
, @RoleId uniqueidentifier = null
AS
BEGIN
SET NOCOUNT ON

SELECT	URA.UserRoleAuthId, URA.UserId, U.UserName, URA.RoleId, R.RoleName, URA.WholeOrg,
URA.SiteId, S.Name as Site,
URA.Concurrency, URA.DateCreated, URA.DateUpdated, URA.CreatedBy, URA.UpdatedBy
FROM	UserRoleAuth URA
INNER JOIN aspnet_Roles R on R.RoleId = URA.RoleId
INNER JOIN aspnet_Users U on U.UserId = URA.UserId
LEFT OUTER JOIN Site S ON URA.SiteId is not null AND URA.SiteId = S.SiteId
WHERE	(@OrganisationId is null OR U.OrganisationId = @OrganisationId)
AND	(@RoleId is null OR URA.RoleId = @RoleId)
AND	(@UserId is null OR URA.UserId = @UserId)
ORDER BY U.UserName

END
GO
/****** Object:  StoredProcedure [dbo].[procListUserName]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListUserName]
(
@ApplicationName nvarchar(256),
@OrganisationId int = null,
@UserNameToMatch nvarchar(256)
)	
AS
BEGIN
SET NOCOUNT ON

DECLARE
@ApplicationId uniqueidentifier

    SELECT
@ApplicationId = NULL

    SELECT
@ApplicationId = ApplicationId
FROM
dbo.aspnet_Applications
WHERE
LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0
                
    SELECT
DISTINCT
UserName
    FROM
dbo.aspnet_Users U
INNER JOIN
UserRoleAuth URA ON URA.UserId = U.UserId
INNER JOIN
dbo.aspnet_Roles R ON R.RoleId = URA.RoleId
    WHERE
U.ApplicationId = @ApplicationId
AND (@OrganisationId is null OR U.OrganisationID = @OrganisationId)
AND U.LoweredUserName LIKE LOWER(@UserNameToMatch + '%')

    ORDER BY
UserName

-- ======================================================================
-- Change History
-- ======================================================================
-- 19-dec-2011 HT
-- User UserRoleAuth instead of aspnet_UsersInRoles
-- 15-Sep-2011 EJM
-- Added distinct as a workaround for the multi role workaround.

END
GO
/****** Object:  StoredProcedure [dbo].[procSaveUserRoleAuth]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveUserRoleAuth]	
@UserRoleAuthID int OUTPUT,	
@UserId uniqueidentifier,
@RoleId uniqueidentifier,
@WholeOrg bit,
@SiteId int,
@CurrentUser varchar(128)
AS
BEGIN
SET NOCOUNT ON

IF @UserRoleAuthID IS NULL BEGIN

INSERT INTO UserRoleAuth(
UserId,
RoleId,
WholeOrg,
SiteId,	
DateCreated,
DateUpdated,
CreatedBy,
UpdatedBy
) VALUES (
@UserId,
@RoleId,
@WholeOrg,
@SiteId,	
GETDATE(),
GETDATE(),
@CurrentUser,
@CurrentUser
)

SET @UserRoleAuthID = SCOPE_IDENTITY()

END ELSE BEGIN

UPDATE UserRoleAuth SET
UserId = @UserId,
RoleId = @RoleId,
WholeOrg = @WholeOrg,
SiteId = @SiteId,	
DateUpdated = GETDATE(),
UpdatedBy = @CurrentUser

WHERE UserRoleAuthID = @UserRoleAuthID

END

SELECT Concurrency FROM UserRoleAuth WHERE UserRoleAuthID = @UserRoleAuthID
END
GO
/****** Object:  StoredProcedure [dbo].[procSaveRoleComponentPermission]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveRoleComponentPermission]	
@RoleComponentPermissionID int OUTPUT,	
@RoleId uniqueidentifier,
@ComponentId int,
@WriteRight bit,
@CurrentUser varchar(128)
AS
BEGIN
SET NOCOUNT ON

IF @RoleComponentPermissionID IS NULL BEGIN

INSERT INTO RoleComponentPermission(
RoleId,
ComponentId,
WriteRight,	
DateCreated,
DateUpdated,
CreatedBy,
UpdatedBy
) VALUES (
@RoleId,
@ComponentId,
@WriteRight,	
GETDATE(),
GETDATE(),
@CurrentUser,
@CurrentUser
)

SET @RoleComponentPermissionID = SCOPE_IDENTITY()

END ELSE BEGIN

UPDATE RoleComponentPermission SET
RoleId = @RoleId,
ComponentId = @ComponentId,
WriteRight = @WriteRight,	
DateUpdated = GETDATE(),
UpdatedBy = @CurrentUser

WHERE RoleComponentPermissionID = @RoleComponentPermissionID

END

SELECT Concurrency FROM RoleComponentPermission WHERE RoleComponentPermissionID = @RoleComponentPermissionID
END
GO
/****** Object:  StoredProcedure [dbo].[procSaveMedicineInput]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveMedicineInput]

@MedicineInputId int OUTPUT,
@SiteId int,
@MedicineId int,
@Date smalldatetime,
@Quantity decimal(20,8),
@Description nvarchar(128),
@InputPrice decimal(20,8),
@Supplier nvarchar(128),
@CurrentUser varchar(128)
AS
BEGIN
SET NOCOUNT ON

	IF @MedicineInputID IS NULL BEGIN

	INSERT INTO MedicineInput(
		SiteId,
		MedicineId,
		Date,
		Quantity,
		Description,
		InputPrice,
		Supplier,
		DateCreated,
		DateUpdated,
		CreatedBy,
		UpdatedBy
	) VALUES (
		@SiteId,
		@MedicineId,
		@Date,
		@Quantity,
		@Description,
		@InputPrice,
		@Supplier,
		GETDATE(),
		GETDATE(),
		@CurrentUser,
		@CurrentUser
	)

	SET @MedicineInputId = SCOPE_IDENTITY()

	END ELSE BEGIN

	UPDATE MedicineInput SET
		SiteId = @SiteId,
		MedicineId = @MedicineId,
		Date = @Date,
		Quantity = @Quantity,
		Description = @Description,
		InputPrice = @InputPrice,
		Supplier = @Supplier,
		DateUpdated = GETDATE(),
		UpdatedBy = @CurrentUser

	WHERE MedicineInputId = @MedicineInputId

END

SELECT Concurrency FROM MedicineInput WHERE MedicineInputId = @MedicineInputId
END
GO
/****** Object:  StoredProcedure [dbo].[procSaveDoctor]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveDoctor]
(
 @DoctorID int OUTPUT
, @OrganisationId int
, @SiteId int
, @FirstName nvarchar(128)
, @LastName nvarchar(128)
, @IsLegacy bit
, @Gender int = NULL
, @Dob smalldatetime = NULL
, @ContactInformationId int = NULL
, @Position nvarchar(128)
, @CurrentUser varchar(128)
)
AS
BEGIN

	SET NOCOUNT ON

	IF @DoctorID IS NULL
	BEGIN

		INSERT INTO [Doctor]
		(
		[OrganisationId]
		, [SiteID]
		, [FirstName]
		, [LastName]
		, [IsLegacy]
		, [Gender]
		, [DoB]	
		, [Position]
		, [ContactInformationId]	
		, [DateCreated]
		, [DateUpdated]
		, [CreatedBy]
		, [UpdatedBy]
		)
		VALUES
		(
		@OrganisationId
		, @SiteId
		, @FirstName
		, @LastName
		, @IsLegacy
		, @Gender
		, @DoB
		, @Position
		, @ContactInformationId
		, GETDATE()
		, GETDATE()
		, @CurrentUser
		, @CurrentUser
		)

		SET @DoctorID = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN

		UPDATE
		[Doctor]
		SET
		[OrganisationId] = @OrganisationId
		, SiteID = @SiteId
		, [FirstName] = @FirstName
		, LastName = @LastName
		, IsLegacy = @IsLegacy
		, Gender = @Gender
		, DoB = @DoB
		, Position = @Position
		, ContactInformationId = @ContactInformationId
		, [DateUpdated] = GETDATE()
		, [UpdatedBy] = @CurrentUser
		WHERE
		[DoctorID] = @DoctorID

	END

	SELECT [Concurrency] FROM [Doctor] WHERE [DoctorID] = @DoctorID

END
GO
/****** Object:  StoredProcedure [dbo].[procListMedicineInput]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListMedicineInput]	
@SiteId int,
@MedicineId int = null,
@DateStart smalldatetime,
@DateEnd smalldatetime
AS
BEGIN
	SET NOCOUNT ON

	SELECT I.MedicineInputId, I.MedicineId, I.SiteId, M.Name, I.Date, I.Quantity, 
			I.Description, I.InputPrice, I.Supplier,
			I.Concurrency, I.DateCreated, I.DateUpdated, I.CreatedBy, I.UpdatedBy
	FROM	MedicineInput I
	INNER JOIN Medicine M on I.MedicineId = M.MedicineId
	WHERE	(@MedicineId is null OR M.MedicineId = @MedicineId)
	AND	(I.SiteId = @SiteId)
	AND	I.Date BETWEEN @DateStart AND @DateEnd
	ORDER BY I.Date, M.Name
END
GO
/****** Object:  Table [dbo].[TreatmentService]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TreatmentService](
	[TreatmentServiceId] [int] IDENTITY(1,1) NOT NULL,
	[TreatmentId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](20, 8) NULL,
	[Description] [nvarchar](max) NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TreatmentService] PRIMARY KEY CLUSTERED 
(
	[TreatmentServiceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TreatmentMedicine]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TreatmentMedicine](
	[TreatmentMedicineId] [int] IDENTITY(1,1) NOT NULL,
	[TreatmentId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](20, 8) NULL,
	[Description] [nvarchar](max) NULL,
	[Concurrency] [timestamp] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateUpdated] [smalldatetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[UpdatedBy] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TreatmentMedicine] PRIMARY KEY CLUSTERED 
(
	[TreatmentMedicineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
@ApplicationName nvarchar(256),
@UserNames	nvarchar(4000),
@RoleNames	nvarchar(4000)
AS
BEGIN
DECLARE @AppId uniqueidentifier
SELECT @AppId = NULL
SELECT @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
IF (@AppId IS NULL)
RETURN(2)


DECLARE @TranStarted bit
SET @TranStarted = 0

IF( @@TRANCOUNT = 0 )
BEGIN
BEGIN TRANSACTION
SET @TranStarted = 1
END

DECLARE @tbNames table(Name nvarchar(256) NOT NULL PRIMARY KEY)
DECLARE @tbRoles table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
DECLARE @tbUsers table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
DECLARE @Num	int
DECLARE @Pos	int
DECLARE @NextPos int
DECLARE @Name	nvarchar(256)
DECLARE @CountAll int
DECLARE @CountU	int
DECLARE @CountR	int


SET @Num = 0
SET @Pos = 1
WHILE(@Pos <= LEN(@RoleNames))
BEGIN
SELECT @NextPos = CHARINDEX(N',', @RoleNames, @Pos)
IF (@NextPos = 0 OR @NextPos IS NULL)
SELECT @NextPos = LEN(@RoleNames) + 1
SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
SELECT @Pos = @NextPos+1

INSERT INTO @tbNames VALUES (@Name)
SET @Num = @Num + 1
END

INSERT INTO @tbRoles
SELECT RoleId
FROM dbo.aspnet_Roles ar, @tbNames t
WHERE LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
SELECT @CountR = @@ROWCOUNT

IF (@CountR <> @Num)
BEGIN
SELECT TOP 1 N'', Name
FROM @tbNames
WHERE LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar, @tbRoles r WHERE r.RoleId = ar.RoleId)
IF( @TranStarted = 1 )
ROLLBACK TRANSACTION
RETURN(2)
END


DELETE FROM @tbNames WHERE 1=1
SET @Num = 0
SET @Pos = 1


WHILE(@Pos <= LEN(@UserNames))
BEGIN
SELECT @NextPos = CHARINDEX(N',', @UserNames, @Pos)
IF (@NextPos = 0 OR @NextPos IS NULL)
SELECT @NextPos = LEN(@UserNames) + 1
SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
SELECT @Pos = @NextPos+1

INSERT INTO @tbNames VALUES (@Name)
SET @Num = @Num + 1
END

INSERT INTO @tbUsers
SELECT UserId
FROM dbo.aspnet_Users ar, @tbNames t
WHERE LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

SELECT @CountU = @@ROWCOUNT
IF (@CountU <> @Num)
BEGIN
SELECT TOP 1 Name, N''
FROM @tbNames
WHERE LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au, @tbUsers u WHERE u.UserId = au.UserId)

IF( @TranStarted = 1 )
ROLLBACK TRANSACTION
RETURN(1)
END

SELECT @CountAll = COUNT(*)
FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
WHERE ur.UserId = u.UserId AND ur.RoleId = r.RoleId

IF (@CountAll <> @CountU * @CountR)
BEGIN
SELECT TOP 1 UserName, RoleName
FROM	@tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
WHERE	u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
IF( @TranStarted = 1 )
ROLLBACK TRANSACTION
RETURN(3)
END

DELETE FROM dbo.aspnet_UsersInRoles
WHERE UserId IN (SELECT UserId FROM @tbUsers)
AND RoleId IN (SELECT RoleId FROM @tbRoles)
IF( @TranStarted = 1 )
COMMIT TRANSACTION
RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256),
    @RoleName nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL
    SELECT @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT @RoleId = NULL

    SELECT @UserId = UserId
    FROM dbo.aspnet_Users
    WHERE LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT @RoleId = RoleId
    FROM dbo.aspnet_Roles
    WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName nvarchar(256),
    @RoleName nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL
    SELECT @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT @RoleId = NULL

     SELECT @RoleId = RoleId
     FROM dbo.aspnet_Roles
     WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName nvarchar(256),
    @UserName nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL
    SELECT @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT @UserId = NULL

    SELECT @UserId = UserId
    FROM dbo.aspnet_Users
    WHERE LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName nvarchar(256),
    @RoleName nvarchar(256),
    @UserNameToMatch nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT @ApplicationId = NULL
    SELECT @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT @RoleId = NULL

     SELECT @RoleId = RoleId
     FROM dbo.aspnet_Roles
     WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
@ApplicationName nvarchar(256),
@UserNames	nvarchar(4000),
@RoleNames	nvarchar(4000),
@CurrentTimeUtc datetime
AS
BEGIN
DECLARE @AppId uniqueidentifier
SELECT @AppId = NULL
SELECT @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
IF (@AppId IS NULL)
RETURN(2)
DECLARE @TranStarted bit
SET @TranStarted = 0

IF( @@TRANCOUNT = 0 )
BEGIN
BEGIN TRANSACTION
SET @TranStarted = 1
END

DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
DECLARE @Num	int
DECLARE @Pos	int
DECLARE @NextPos	int
DECLARE @Name	nvarchar(256)

SET @Num = 0
SET @Pos = 1
WHILE(@Pos <= LEN(@RoleNames))
BEGIN
SELECT @NextPos = CHARINDEX(N',', @RoleNames, @Pos)
IF (@NextPos = 0 OR @NextPos IS NULL)
SELECT @NextPos = LEN(@RoleNames) + 1
SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
SELECT @Pos = @NextPos+1

INSERT INTO @tbNames VALUES (@Name)
SET @Num = @Num + 1
END

INSERT INTO @tbRoles
SELECT RoleId
FROM dbo.aspnet_Roles ar, @tbNames t
WHERE LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

IF (@@ROWCOUNT <> @Num)
BEGIN
SELECT TOP 1 Name
FROM @tbNames
WHERE LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar, @tbRoles r WHERE r.RoleId = ar.RoleId)
IF( @TranStarted = 1 )
ROLLBACK TRANSACTION
RETURN(2)
END

DELETE FROM @tbNames WHERE 1=1
SET @Num = 0
SET @Pos = 1

WHILE(@Pos <= LEN(@UserNames))
BEGIN
SELECT @NextPos = CHARINDEX(N',', @UserNames, @Pos)
IF (@NextPos = 0 OR @NextPos IS NULL)
SELECT @NextPos = LEN(@UserNames) + 1
SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
SELECT @Pos = @NextPos+1

INSERT INTO @tbNames VALUES (@Name)
SET @Num = @Num + 1
END

INSERT INTO @tbUsers
SELECT UserId
FROM dbo.aspnet_Users ar, @tbNames t
WHERE LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

IF (@@ROWCOUNT <> @Num)
BEGIN
DELETE FROM @tbNames
WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au, @tbUsers u WHERE au.UserId = u.UserId)

INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
FROM @tbNames

INSERT INTO @tbUsers
SELECT UserId
FROM	dbo.aspnet_Users au, @tbNames t
WHERE LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
END

IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
BEGIN
SELECT TOP 1 UserName, RoleName
FROM	dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
WHERE	u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

IF( @TranStarted = 1 )
ROLLBACK TRANSACTION
RETURN(3)
END

INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
SELECT UserId, RoleId
FROM @tbUsers, @tbRoles

IF( @TranStarted = 1 )
COMMIT TRANSACTION
RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[procDeleteMedicineInput]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procDeleteMedicineInput](@TreatmentId int)	
AS
BEGIN
SET NOCOUNT ON

DELETE Treatment WHERE TreatmentId = @TreatmentId
END
GO
/****** Object:  StoredProcedure [dbo].[procDeleteDoctor]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procDeleteDoctor](@DoctorId int)	
AS
BEGIN
SET NOCOUNT ON

DELETE Doctor WHERE DoctorId = @DoctorId
END
GO
/****** Object:  StoredProcedure [dbo].[procListAspUser]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListAspUser]	
@OrganisationId int = null	
, @UserID uniqueidentifier = null
, @IsLegacy bit = null
AS
BEGIN
	SET NOCOUNT ON
	SELECT distinct M.ApplicationId,M.UserId,Password,PasswordFormat,PasswordSalt,MobilePIN
		,Email,LoweredEmail,PasswordQuestion,PasswordAnswer,IsApproved,IsLockedOut
		,CreateDate,LastLoginDate,LastPasswordChangedDate,LastLockoutDate
		,FailedPasswordAttemptCount,FailedPasswordAttemptWindowStart,FailedPasswordAnswerAttemptCount
		,FailedPasswordAnswerAttemptWindowStart,NULL as Comment
		,U.UserName,U.LoweredUserName,U.MobileAlias, U.IsAnonymous,U.LastActivityDate, U.OrganisationID	
		,URA.SiteId
		,dbo.[ufnUserRoleMinLevel](M.UserId) as MinRoleLevel
	FROM aspnet_Membership M
	INNER JOIN aspnet_Users U on M.UserId = U.UserId	
	LEFT OUTER JOIN UserRoleAuth URA on U.UserId = URA.UserId
	WHERE (@OrganisationId is null or U.OrganisationId = @OrganisationId)
	AND (@UserID is null OR M.UserId = @UserID)
	ORDER BY U.UserName


	-- ======================================================================
	-- Change History
	-- ======================================================================
	-- 23-Feb-2013 HT
	-- INIT
END
GO
/****** Object:  StoredProcedure [dbo].[procDeleteTreatmentService]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procDeleteTreatmentService]
(
@TreatmentServiceId int
)
AS
BEGIN
SET NOCOUNT ON

DELETE FROM TreatmentService WHERE TreatmentServiceId = @TreatmentServiceId

END
GO
/****** Object:  StoredProcedure [dbo].[procDeleteTreatmentMedicine]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procDeleteTreatmentMedicine]
(
@TreatmentEquipmenId int
)
AS
BEGIN
SET NOCOUNT ON

DELETE FROM TreatmentMedicine WHERE TreatmentMedicineId = @TreatmentEquipmenId

END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetTotalTreatmentPrice]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetTotalTreatmentPrice]
(
@TreatmentId int
)
RETURNS  decimal(20,8)
AS
BEGIN
DECLARE @Service decimal(20,8)
		, @Medicine decimal(20,8)

SELECT @Service = SUM(S.Quantity * ISNULL(S.Price,0))
FROM TreatmentService S 
WHERE S.TreatmentId = @TreatmentId

SELECT @Medicine = SUM(S.Quantity * ISNULL(S.Price,0))
FROM TreatmentMedicine S 
WHERE S.TreatmentId = @TreatmentId

RETURN (@Service + @Medicine)

END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetMedicineTotalLeft]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetMedicineTotalLeft]
(
@SiteiId int,
@MedicinId int,
@DateStart smalldatetime
)
RETURNS  decimal(20,8)
AS
BEGIN
	DECLARE @Input decimal(20,8)
			, @Sold decimal(20,8)

	SELECT @Input = SUM(I.Quantity)
	FROM MedicineInput I 
	WHERE I.SiteId = @SiteiId
	AND I.MedicineId = @MedicinId
	AND I.Date < @DateStart

	SELECT @Sold = SUM(S.Quantity)
	FROM TreatmentMedicine S 
	INNER JOIN Treatment T on S.TreatmentId = T.TreatmentId
	WHERE T.SiteId = @SiteiId
	AND   S.MedicineId = @MedicinId
	AND   T.Date < @DateStart

	RETURN (ISNULL(@Input + @Sold, 0))

END
GO
/****** Object:  StoredProcedure [dbo].[procSaveTreatmentService]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveTreatmentService]

@TreatmentServiceId int OUTPUT,
@TreatmentId int,
@ServiceId int,
@Quantity int,
@Price decimal(20,8),
@Description nvarchar(128),
@CurrentUser varchar(128)
AS
BEGIN
	SET NOCOUNT ON

	IF NOT EXISTS (SELECT * FROM TreatmentService WHERE TreatmentId = @TreatmentId AND ServiceId = @ServiceId)
	BEGIN

		INSERT INTO TreatmentService(
			TreatmentId,
			ServiceId,
			Quantity,
			Price,
			Description,	
			DateCreated,
			DateUpdated,
			CreatedBy,
			UpdatedBy
		) VALUES (
			@TreatmentId,
			@ServiceId,
			@Quantity,
			@Price,
			@Description,
			GETDATE(),
			GETDATE(),
			@CurrentUser,
			@CurrentUser
		)

		SET @TreatmentServiceId = SCOPE_IDENTITY()

	END ELSE BEGIN

		UPDATE TreatmentService SET
			TreatmentId = @TreatmentId,
			ServiceId = @ServiceId,
			Quantity = @Quantity,
			Price = @Price,
			Description = @Description,	
			DateUpdated = GETDATE(),
			UpdatedBy = @CurrentUser

		WHERE TreatmentId = @TreatmentId AND ServiceId = @ServiceId

	END

	SELECT Concurrency FROM TreatmentService WHERE TreatmentId = @TreatmentId AND ServiceId = @ServiceId
END
GO
/****** Object:  StoredProcedure [dbo].[procSaveTreatmentMedicine]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSaveTreatmentMedicine]

@TreatmentMedicineId int OUTPUT,
@TreatmentId int,
@MedicineId int,
@Quantity int,
@Price decimal(20,8),
@Description nvarchar(128),
@CurrentUser varchar(128)
AS
BEGIN
	SET NOCOUNT ON

	IF NOT EXISTS (SELECT * FROM TreatmentMedicine WHERE TreatmentId = @TreatmentId AND MedicineId = @MedicineId)
	BEGIN

		INSERT INTO TreatmentMedicine(
			TreatmentId,
			MedicineId,
			Quantity,
			Price,
			Description,	
			DateCreated,
			DateUpdated,
			CreatedBy,
			UpdatedBy
		) VALUES (
			@TreatmentId,
			@MedicineId,
			@Quantity,
			@Price,
			@Description,
			GETDATE(),
			GETDATE(),
			@CurrentUser,
			@CurrentUser
		)

		SET @TreatmentMedicineId = SCOPE_IDENTITY()

	END ELSE BEGIN

		UPDATE TreatmentMedicine SET
			TreatmentId = @TreatmentId,
			MedicineId = @MedicineId,
			Quantity = @Quantity,
			Price = @Price,
			Description = @Description,	
			DateUpdated = GETDATE(),
			UpdatedBy = @CurrentUser

		WHERE TreatmentId = @TreatmentId AND MedicineId = @MedicineId

	END

	SELECT Concurrency FROM TreatmentMedicine WHERE TreatmentId = @TreatmentId AND MedicineId = @MedicineId
END
GO
/****** Object:  StoredProcedure [dbo].[procListTreatmentService]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListTreatmentService]	
@TreatmentServiceId int = null,
@TreatmentId int = null
AS
BEGIN
SET NOCOUNT ON

	SELECT	RE.TreatmentServiceId, RE.TreatmentId, RE.ServiceId, E.Name as Service,
	RE.Quantity, RE.Price, RE.Quantity * Re.Price as TotalPrice, RE.Description, E.Unit, E.Price as BasePrice,
	RE.Concurrency, RE.DateCreated, RE.DateUpdated, RE.CreatedBy, RE.UpdatedBy
	FROM	TreatmentService RE
	INNER JOIN Service E on RE.ServiceId = e.ServiceId
	WHERE	(@TreatmentServiceId is null OR RE.TreatmentServiceId = @TreatmentServiceId)
	AND	(@TreatmentId is null OR RE.TreatmentId = @TreatmentId)

END
GO
/****** Object:  StoredProcedure [dbo].[procListTreatmentMedicine]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListTreatmentMedicine]	
@TreatmentMedicineId int = null,
@TreatmentId int = null
AS
BEGIN
SET NOCOUNT ON

	SELECT	RE.TreatmentMedicineId, RE.TreatmentId, RE.MedicineId, e.Name as Medicine,
		RE.Quantity, RE.Price, RE.Quantity * Re.Price as TotalPrice, RE.Description, E.Unit, E.Price as BasePrice, 
		RE.Concurrency, RE.DateCreated, RE.DateUpdated, RE.CreatedBy, RE.UpdatedBy
	FROM	TreatmentMedicine RE
	INNER JOIN Medicine E on RE.MedicineId = e.MedicineId
	WHERE	(@TreatmentMedicineId is null OR RE.TreatmentMedicineId = @TreatmentMedicineId)
	AND	(@TreatmentId is null OR RE.TreatmentId = @TreatmentId)

END
GO
/****** Object:  StoredProcedure [dbo].[procListTreatment]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListTreatment]	
@OrganisationId int,
@SiteId int = null,
@CustomerId int = null,
@DoctorId int = null,
@TreatmentId int = null,
@ContractDateStart smalldatetime = null,
@ContractDateEnd smalldatetime = null
AS
BEGIN
SET NOCOUNT ON

	SELECT	T.TreatmentId, T.SiteId, S.Name as SiteName, T.CustomerId, C.FirstName + ' ' + C.LastName as CustomerName, 
		T.DoctorId,	D.FirstName + ' ' + D.FirstName as DoctorName,
		T.Date, T.Description, [dbo].[ufnGetTotalTreatmentPrice](T.TreatmentId) as TotalPrice,
		T.Concurrency, T.DateCreated, T.DateUpdated, T.CreatedBy, T.UpdatedBy
	FROM	Treatment T
	INNER JOIN Site S on T.SiteId = S.SiteID
	INNER JOIN Customer C on T.CustomerId = C.CustomerId		
	INNER JOIN Doctor D on D.DoctorId = T.DoctorId		
	WHERE C.OrganisationID = @OrganisationId
	AND (@SiteId is null OR T.SiteID = @SiteId)
	AND (@CustomerId is null OR C.CustomerId = @CustomerId)
	AND	(@TreatmentId is null OR T.TreatmentId = @TreatmentId)
	AND (@ContractDateStart IS NULL AND @ContractDateEnd IS NULL			 
			 OR @ContractDateStart IS NOT NULL AND @ContractDateEnd IS NULL AND T.Date >= @ContractDateStart
			 OR @ContractDateStart IS NULL AND @ContractDateEnd IS NOT NULL AND T.Date <= @ContractDateEnd
			 OR T.Date Between @ContractDateStart and @ContractDateEnd
			)
END
GO
/****** Object:  StoredProcedure [dbo].[procListSiteMedicineStatus]    Script Date: 08/04/2015 14:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procListSiteMedicineStatus]	
@SiteId int,
@MedicineId int = null,
@DateStart smalldatetime,
@DateEnd smalldatetime,
@ShowLegacy bit
AS
BEGIN
	SET NOCOUNT ON

	SELECT	RE.MedicineId, RE.OrganisationId, RE.Name,
			ISNULL(A.Quantity, 0) as Quantity, ISNULL(A.TotalPrice,0) as InputPrice, ISNULL(C.SoldQuantity,0) as SoldQuantity, 
			[dbo].[ufnGetMedicineTotalLeft](@SiteId, RE.MedicineId, @DateStart) as BeginPeriodQuantity, 
			RE.IsLegacy, RE.Description, RE.Price, RE.Unit,
			RE.Concurrency, RE.DateCreated, RE.DateUpdated, RE.CreatedBy, RE.UpdatedBy
	FROM	Medicine RE
	LEFT OUTER JOIN (SELECT I.SiteId, I.MedicineId, SUM(I.Quantity) as Quantity, SUM(I.Quantity * I.InputPrice) as TotalPrice 
				FROm MedicineInput I				
				WHERE I.SiteId = @SiteId
				AND I.Date Between @DateStart and @DateEnd
				GROUP BY I.SiteId, I.MedicineId
				) A on A.MedicineId = RE.MedicineId
	LEFT OUTER JOIN 
				(SELECT T.SiteId, I.MedicineId, SUM(I.Quantity) as SoldQuantity
				FROm TreatmentMedicine I
				INNER JOIN Treatment T on I.TreatmentId = T.TreatmentId				
				WHERE T.SiteId = @SiteId
				AND T.Date between @DateStart and @DateEnd
				GROUP BY T.SiteId, I.MedicineId
				) C on C.MedicineId = RE.MedicineId
								
	WHERE	(@MedicineId is null OR RE.MedicineId = @MedicineId)	
	AND	(@ShowLegacy = 1 OR RE.IsLegacy = 0)

END
GO
/****** Object:  Default [DF_Organisation_DisplayIndex]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Organisation] ADD  CONSTRAINT [DF_Organisation_DisplayIndex]  DEFAULT ((0)) FOR [DisplayIndex]
GO
/****** Object:  Default [DF_Organisation_IsLegacy]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Organisation] ADD  CONSTRAINT [DF_Organisation_IsLegacy]  DEFAULT ((0)) FOR [IsLegacy]
GO
/****** Object:  Default [DF_Organisation_AuthorisationCode]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Organisation] ADD  CONSTRAINT [DF_Organisation_AuthorisationCode]  DEFAULT (replace(CONVERT([varchar](100),newid(),(0)),'-','')) FOR [AuthorisationCode]
GO
/****** Object:  Default [DF_ImageType_DateCreated]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[ImageType] ADD  CONSTRAINT [DF_ImageType_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_ImageType_DateUpdated]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[ImageType] ADD  CONSTRAINT [DF_ImageType_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_ImageType_CreatedBy]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[ImageType] ADD  CONSTRAINT [DF_ImageType_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_ImageType_UpdatedBy]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[ImageType] ADD  CONSTRAINT [DF_ImageType_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  Default [DF_Component_DateCreated]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Component] ADD  CONSTRAINT [DF_Component_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Component_DateUpdated]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Component] ADD  CONSTRAINT [DF_Component_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Component_CreatedBy]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Component] ADD  CONSTRAINT [DF_Component_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_Component_UpdatedBy]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Component] ADD  CONSTRAINT [DF_Component_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF_Country_DateCreated]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Country_DateUpdated]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Country_CreatedBy]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_Country_UpdatedBy]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF_ContactType_DateCreated]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[ContactType] ADD  CONSTRAINT [DF_ContactType_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_ContactType_DateUpdated]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[ContactType] ADD  CONSTRAINT [DF_ContactType_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_ContactType_CreatedBy]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[ContactType] ADD  CONSTRAINT [DF_ContactType_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_ContactType_UpdatedBy]    Script Date: 08/04/2015 14:41:08 ******/
ALTER TABLE [dbo].[ContactType] ADD  CONSTRAINT [DF_ContactType_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  Default [DF__TagVersio__DateC__17F790F9]    Script Date: 08/04/2015 14:41:09 ******/
ALTER TABLE [dbo].[TagVersion] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__17036CC0]    Script Date: 08/04/2015 14:41:09 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__18EBB532]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__19DFD96B]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__1AD3FDA4]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__1BC821DD]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__Site__LicenseKey__10E07F16]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Site] ADD  DEFAULT ('cfeb48b3-aa4b-46c8-9948-cd6412243ab6') FOR [LicenseKey]
GO
/****** Object:  Default [DF_Site_DisplayIndex]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Site] ADD  CONSTRAINT [DF_Site_DisplayIndex]  DEFAULT ((0)) FOR [DisplayIndex]
GO
/****** Object:  Default [DF_Site_IsLegacy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Site] ADD  CONSTRAINT [DF_Site_IsLegacy]  DEFAULT ((0)) FOR [IsLegacy]
GO
/****** Object:  Default [DF_Site_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Site] ADD  CONSTRAINT [DF_Site_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Site_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Site] ADD  CONSTRAINT [DF_Site_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Site_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Site] ADD  CONSTRAINT [DF_Site_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_Site_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Site] ADD  CONSTRAINT [DF_Site_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF_Service_IsLegacy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_IsLegacy]  DEFAULT ((0)) FOR [IsLegacy]
GO
/****** Object:  Default [DF_Service_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Service_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Service_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_Service_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  Default [DF_ContactInformation_State]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_State]  DEFAULT ('') FOR [State]
GO
/****** Object:  Default [DF_ContactInformation_Postcode]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_Postcode]  DEFAULT ('') FOR [Postcode]
GO
/****** Object:  Default [DF_ContactInformation_Country]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_Country]  DEFAULT ('') FOR [CountryId]
GO
/****** Object:  Default [DF_ContactInformation_PhoneNumber]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
/****** Object:  Default [DF_ContactInformation_FaxNumber]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_FaxNumber]  DEFAULT ('') FOR [FaxNumber]
GO
/****** Object:  Default [DF_ContactInformation_Email]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_Email]  DEFAULT ('') FOR [Email]
GO
/****** Object:  Default [DF_ContactInformation_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_ContactInformation_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_ContactInformation_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_ContactInformation_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF_City_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_City_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_City_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_City_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF_Customer_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Customer_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Customer_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_Customer_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF_Image_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Image_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Image_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_Image_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF_Image_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF_Medicine_IsLegacy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_IsLegacy]  DEFAULT ((0)) FOR [IsLegacy]
GO
/****** Object:  Default [DF_Medicine_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Medicine_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Medicine_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_Medicine_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Medicine] ADD  CONSTRAINT [DF_Medicine_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  Default [DF_MedicineInput_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[MedicineInput] ADD  CONSTRAINT [DF_MedicineInput_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_MedicineInput_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[MedicineInput] ADD  CONSTRAINT [DF_MedicineInput_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_MedicineInput_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[MedicineInput] ADD  CONSTRAINT [DF_MedicineInput_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_MedicineInput_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[MedicineInput] ADD  CONSTRAINT [DF_MedicineInput_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  Default [DF_Doctor_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Doctor] ADD  CONSTRAINT [DF_Doctor_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Doctor_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Doctor] ADD  CONSTRAINT [DF_Doctor_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_Doctor_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Doctor] ADD  CONSTRAINT [DF_Doctor_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_Doctor_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Doctor] ADD  CONSTRAINT [DF_Doctor_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF_District_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[District] ADD  CONSTRAINT [DF_District_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_District_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[District] ADD  CONSTRAINT [DF_District_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_District_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[District] ADD  CONSTRAINT [DF_District_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_District_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[District] ADD  CONSTRAINT [DF_District_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF_RoleComponentPermission_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[RoleComponentPermission] ADD  CONSTRAINT [DF_RoleComponentPermission_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_RoleComponentPermission_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[RoleComponentPermission] ADD  CONSTRAINT [DF_RoleComponentPermission_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_RoleComponentPermission_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[RoleComponentPermission] ADD  CONSTRAINT [DF_RoleComponentPermission_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_RoleComponentPermission_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[RoleComponentPermission] ADD  CONSTRAINT [DF_RoleComponentPermission_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__30C33EC3]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  Default [DF_UserRoleAuth_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[UserRoleAuth] ADD  CONSTRAINT [DF_UserRoleAuth_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_UserRoleAuth_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[UserRoleAuth] ADD  CONSTRAINT [DF_UserRoleAuth_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_UserRoleAuth_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[UserRoleAuth] ADD  CONSTRAINT [DF_UserRoleAuth_CreatedBy]  DEFAULT ('') FOR [CreatedBy]
GO
/****** Object:  Default [DF_UserRoleAuth_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[UserRoleAuth] ADD  CONSTRAINT [DF_UserRoleAuth_UpdatedBy]  DEFAULT ('') FOR [UpdatedBy]
GO
/****** Object:  Default [DF_TreatmentService_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentService] ADD  CONSTRAINT [DF_TreatmentService_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_TreatmentService_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentService] ADD  CONSTRAINT [DF_TreatmentService_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_TreatmentService_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentService] ADD  CONSTRAINT [DF_TreatmentService_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_TreatmentService_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentService] ADD  CONSTRAINT [DF_TreatmentService_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  Default [DF_TreatmentMedicine_DateCreated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentMedicine] ADD  CONSTRAINT [DF_TreatmentMedicine_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_TreatmentMedicine_DateUpdated]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentMedicine] ADD  CONSTRAINT [DF_TreatmentMedicine_DateUpdated]  DEFAULT (getdate()) FOR [DateUpdated]
GO
/****** Object:  Default [DF_TreatmentMedicine_CreatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentMedicine] ADD  CONSTRAINT [DF_TreatmentMedicine_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_TreatmentMedicine_UpdatedBy]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentMedicine] ADD  CONSTRAINT [DF_TreatmentMedicine_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__55009F39]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__55F4C372]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__56E8E7AB]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK_Site_Organisation]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_Site_Organisation] FOREIGN KEY([OrganisationID])
REFERENCES [dbo].[Organisation] ([OrganisationID])
GO
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_Site_Organisation]
GO
/****** Object:  ForeignKey [FK_Service_Organisation]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Organisation]
GO
/****** Object:  ForeignKey [FK_ContactInformation_ContactType]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation]  WITH CHECK ADD  CONSTRAINT [FK_ContactInformation_ContactType] FOREIGN KEY([ContactTypeId])
REFERENCES [dbo].[ContactType] ([ContactTypeId])
GO
ALTER TABLE [dbo].[ContactInformation] CHECK CONSTRAINT [FK_ContactInformation_ContactType]
GO
/****** Object:  ForeignKey [FK_ContactInformation_Country]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[ContactInformation]  WITH CHECK ADD  CONSTRAINT [FK_ContactInformation_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[ContactInformation] CHECK CONSTRAINT [FK_ContactInformation_Country]
GO
/****** Object:  ForeignKey [FK_City_Country]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
/****** Object:  ForeignKey [FK_Customer_Organisation]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Organisation] FOREIGN KEY([OrganisationID])
REFERENCES [dbo].[Organisation] ([OrganisationID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Organisation]
GO
/****** Object:  ForeignKey [FK_Image_ImageType]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_ImageType] FOREIGN KEY([ImageTypeId])
REFERENCES [dbo].[ImageType] ([ImageTypeId])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_ImageType]
GO
/****** Object:  ForeignKey [FK_Medicine_Organisation]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([OrganisationID])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Organisation]
GO
/****** Object:  ForeignKey [FK_MedicineInput_Medicine]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[MedicineInput]  WITH CHECK ADD  CONSTRAINT [FK_MedicineInput_Medicine] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicine] ([MedicineId])
GO
ALTER TABLE [dbo].[MedicineInput] CHECK CONSTRAINT [FK_MedicineInput_Medicine]
GO
/****** Object:  ForeignKey [FK_MedicineInput_Site]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[MedicineInput]  WITH CHECK ADD  CONSTRAINT [FK_MedicineInput_Site] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[MedicineInput] CHECK CONSTRAINT [FK_MedicineInput_Site]
GO
/****** Object:  ForeignKey [FK_Doctor_Organisation]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Organisation] FOREIGN KEY([OrganisationID])
REFERENCES [dbo].[Organisation] ([OrganisationID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Organisation]
GO
/****** Object:  ForeignKey [FK_Doctor_Site]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Site] FOREIGN KEY([SiteID])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Site]
GO
/****** Object:  ForeignKey [FK_District_City]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_City]
GO
/****** Object:  ForeignKey [FK_Treatment_Site]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[Treatment]  WITH CHECK ADD  CONSTRAINT [FK_Treatment_Site] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[Treatment] CHECK CONSTRAINT [FK_Treatment_Site]
GO
/****** Object:  ForeignKey [FK_RoleComponentPermission_Role]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[RoleComponentPermission]  WITH CHECK ADD  CONSTRAINT [FK_RoleComponentPermission_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[RoleComponentPermission] CHECK CONSTRAINT [FK_RoleComponentPermission_Role]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__5AB9788F]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__5BAD9CC8]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__5CA1C101]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__5D95E53A]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK_UserRoleAuth_Role]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[UserRoleAuth]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleAuth_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoleAuth] CHECK CONSTRAINT [FK_UserRoleAuth_Role]
GO
/****** Object:  ForeignKey [FK_UserRoleAuth_Site]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[UserRoleAuth]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleAuth_Site] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Site] ([SiteID])
GO
ALTER TABLE [dbo].[UserRoleAuth] CHECK CONSTRAINT [FK_UserRoleAuth_Site]
GO
/****** Object:  ForeignKey [FK_UserRoleAuth_User]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[UserRoleAuth]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleAuth_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[UserRoleAuth] CHECK CONSTRAINT [FK_UserRoleAuth_User]
GO
/****** Object:  ForeignKey [FK_TreatmentService_Service]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentService]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentService_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([ServiceId])
GO
ALTER TABLE [dbo].[TreatmentService] CHECK CONSTRAINT [FK_TreatmentService_Service]
GO
/****** Object:  ForeignKey [FK_TreatmentService_Treatment]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentService]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentService_Treatment] FOREIGN KEY([TreatmentId])
REFERENCES [dbo].[Treatment] ([TreatmentId])
GO
ALTER TABLE [dbo].[TreatmentService] CHECK CONSTRAINT [FK_TreatmentService_Treatment]
GO
/****** Object:  ForeignKey [FK_TreatmentMedicine_Medicine]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentMedicine]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentMedicine_Medicine] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicine] ([MedicineId])
GO
ALTER TABLE [dbo].[TreatmentMedicine] CHECK CONSTRAINT [FK_TreatmentMedicine_Medicine]
GO
/****** Object:  ForeignKey [FK_TreatmentMedicine_Treatment]    Script Date: 08/04/2015 14:41:10 ******/
ALTER TABLE [dbo].[TreatmentMedicine]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentMedicine_Treatment] FOREIGN KEY([TreatmentId])
REFERENCES [dbo].[Treatment] ([TreatmentId])
GO
ALTER TABLE [dbo].[TreatmentMedicine] CHECK CONSTRAINT [FK_TreatmentMedicine_Treatment]
GO
