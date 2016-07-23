USE [master]
GO
/****** Object:  Database [WelpDB]    Script Date: 7/23/2016 3:32:53 PM ******/
CREATE DATABASE [WelpDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WelpDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WelpDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WelpDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WelpDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WelpDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WelpDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WelpDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WelpDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WelpDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WelpDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WelpDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WelpDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WelpDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WelpDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WelpDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WelpDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WelpDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WelpDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WelpDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WelpDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WelpDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WelpDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WelpDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WelpDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WelpDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WelpDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WelpDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WelpDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WelpDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WelpDB] SET  MULTI_USER 
GO
ALTER DATABASE [WelpDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WelpDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WelpDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WelpDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WelpDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WelpDB]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 7/23/2016 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[BusinessID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessName] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[BusinessHours] [nvarchar](50) NOT NULL,
	[BusinessLocation] [nvarchar](100) NOT NULL,
	[BusinessPhoneNumber] [int] NOT NULL,
	[BusinessProfile] [nvarchar](max) NULL,
	[Photos] [nvarchar](max) NULL,
 CONSTRAINT [PK_Business] PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 7/23/2016 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[Stars] [int] NOT NULL,
	[Comments] [nvarchar](max) NOT NULL,
	[UsersID] [int] NOT NULL,
	[BusinessID] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/23/2016 3:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[BusinessID] [int] NULL,
	[BusinessName] [nvarchar](50) NULL,
	[E-mail] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD  CONSTRAINT [FK_Business_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Business] CHECK CONSTRAINT [FK_Business_Users]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Business] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Business] ([BusinessID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Business]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([UsersID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO
USE [master]
GO
ALTER DATABASE [WelpDB] SET  READ_WRITE 
GO
