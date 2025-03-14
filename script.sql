USE [master]
GO
/****** Object:  Database [Db_Utube]    Script Date: 7/27/2024 2:19:30 AM ******/
CREATE DATABASE [Db_Utube]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Db_Utube', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Db_Utube.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Db_Utube_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Db_Utube_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Db_Utube] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db_Utube].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Db_Utube] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Db_Utube] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Db_Utube] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Db_Utube] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Db_Utube] SET ARITHABORT OFF 
GO
ALTER DATABASE [Db_Utube] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Db_Utube] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Db_Utube] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Db_Utube] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Db_Utube] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Db_Utube] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Db_Utube] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Db_Utube] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Db_Utube] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Db_Utube] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Db_Utube] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Db_Utube] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Db_Utube] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Db_Utube] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Db_Utube] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Db_Utube] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Db_Utube] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Db_Utube] SET RECOVERY FULL 
GO
ALTER DATABASE [Db_Utube] SET  MULTI_USER 
GO
ALTER DATABASE [Db_Utube] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Db_Utube] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Db_Utube] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Db_Utube] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Db_Utube] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Db_Utube] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Db_Utube', N'ON'
GO
ALTER DATABASE [Db_Utube] SET QUERY_STORE = ON
GO
ALTER DATABASE [Db_Utube] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Db_Utube]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/27/2024 2:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Categories] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 7/27/2024 2:19:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[Thumbnail] [varchar](50) NULL,
	[URL] [varchar](80) NULL,
	[Category] [varchar](50) NULL,
	[UploadedDate] [datetime] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Db_Utube] SET  READ_WRITE 
GO
