USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 03/24/2015 17:40:38 ******/
CREATE DATABASE [TestDB] ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TestDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TestDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TestDB] SET  READ_WRITE
GO
ALTER DATABASE [TestDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TestDB] SET  MULTI_USER
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDB', N'ON'
GO
USE [TestDB]
GO
/****** Object:  User [LSI-DEV\lsidev-sa-remoting]    Script Date: 03/24/2015 17:40:38 ******/
CREATE USER [LSI-DEV\lsidev-sa-remoting] FOR LOGIN [LSI-DEV\lsidev-sa-remoting] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 03/24/2015 17:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](150) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](100) NULL,
	[Email] [varchar](150) NULL,
	[UserType] [varchar](100) NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTicket]    Script Date: 03/24/2015 17:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTicket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [varchar](1500) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Status] [varchar](100) NULL,
	[Email] [varchar](150) NULL,
	[Location] [varchar](100) NULL,
	[ContactPerson] [varchar](100) NOT NULL,
	[ContactNumber] [varchar](100) NULL,
	[StepsToReproduce] [varchar](1500) NULL,
	[ActionsToResolve] [varchar](1000) NULL,
	[DateCreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Title] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[tblUsersUpdate]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblUsersUpdate]
	@FirstName varchar (100),
	@LastName varchar (150),
	@UserName varchar (100),
	@Password varchar (100),
	@Email varchar (150),
	@UserType varchar (100),
	@Active bit
AS
	UPDATE [tblUsers]
	SET	FirstName = @FirstName,
		LastName = @LastName,
		Password = @Password,
		Email = @Email,
		UserType = @UserType,
		Active = @Active
	where [UserName] = @UserName
GO
/****** Object:  StoredProcedure [dbo].[tblUsersSelectAll]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblUsersSelectAll]
AS
	SELECT * FROM [tblUsers]
GO
/****** Object:  StoredProcedure [dbo].[tblUsersSelect]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblUsersSelect]
	@UserName varchar (100)
AS
	SELECT * FROM [tblUsers]
	where [UserName] = @UserName
GO
/****** Object:  StoredProcedure [dbo].[tblUsersInsert]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblUsersInsert]
	@FirstName varchar (100),
	@LastName varchar (150),
	@UserName varchar (100),
	@Password varchar (100),
	@Email varchar (150),
	@UserType varchar (100),
	@Active bit
AS
	INSERT INTO [tblUsers] (FirstName, LastName, UserName, Password, Email,UserType,Active)
	VALUES (@FirstName, @LastName, @UserName, @Password, @Email,@UserType,@Active  )
GO
/****** Object:  StoredProcedure [dbo].[tblUsersDelete]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblUsersDelete]
	@UserName varchar(100)
AS
	DELETE FROM [tblUsers]
	WHERE
		[UserName] = @UserName
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[tblUsersAuthenticate]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblUsersAuthenticate]
	@UserName varchar (100),
	@Password varchar (100)
AS
	SELECT * FROM [tblUsers]
	where [UserName] = @UserName and Password = @Password
GO
/****** Object:  StoredProcedure [dbo].[tblTicketUpdate]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblTicketUpdate]
	@Title [varchar](100),
	@Description [varchar](1500),
	@UserName [varchar](100),
	@Status [varchar](100),
	@Email [varchar](150),
	@Location [varchar](100),
	@ContactPerson [varchar](100),
	@ContactNumber [varchar](100),
	@StepsToReproduce [varchar](1500),
	@ActionsToResolve [varchar](1000),
	@DateCreated [datetime]
AS
	UPDATE tblTicket
	SET  
		Description = @Description,
		UserName = @UserName, 
		Status = @Status, 
		Email = @Email, 
		Location = @Location, 
		ContactPerson = @ContactPerson, 
		ContactNumber = @ContactNumber,
		StepsToReproduce = @StepsToReproduce, 
		ActionsToResolve = @ActionsToResolve, 
		DateCreated = @DateCreated
	WHERE Title = @Title
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[tblTicketSelectAll]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblTicketSelectAll]
AS
	SELECT * FROM [tblTicket]
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[tblTicketSelect]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblTicketSelect]
	@Title varchar(100)
AS
	SELECT * FROM [tblTicket]
	WHERE
		[Title] = @Title
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[tblTicketInsert]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblTicketInsert]
	@Title [varchar](100),
	@Description [varchar](1500),
	@UserName [varchar](100),
	@Status [varchar](100),
	@Email [varchar](150),
	@Location [varchar](100),
	@ContactPerson [varchar](100),
	@ContactNumber [varchar](100),
	@StepsToReproduce [varchar](1500),
	@ActionsToResolve [varchar](1000),
	@DateCreated [datetime]
AS
	INSERT INTO tblTicket(Title, Description,UserName, Status, Email, Location, ContactPerson, ContactNumber,StepsToReproduce, ActionsToResolve, DateCreated)
	VALUES(@Title, @Description,@UserName, @Status, @Email, @Location, @ContactPerson, @ContactNumber,@StepsToReproduce, @ActionsToResolve, @DateCreated  )
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[tblTicketDelete]    Script Date: 03/24/2015 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tblTicketDelete]
	@Title varchar(100)
AS
	DELETE FROM [tblTicket]
	WHERE
		[Title] = @Title
	RETURN
GO
