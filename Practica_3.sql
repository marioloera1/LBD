USE [master]
GO
/****** Object:  Database [Proyecto_Senda_01]    Script Date: 14/10/2017 04:43:02 a. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Proyecto_Senda_01')
BEGIN
CREATE DATABASE [Proyecto_Senda_01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto_Senda_01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Proyecto_Senda_01.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Proyecto_Senda_01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Proyecto_Senda_01_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [Proyecto_Senda_01] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto_Senda_01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto_Senda_01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Proyecto_Senda_01] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto_Senda_01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto_Senda_01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto_Senda_01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Proyecto_Senda_01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto_Senda_01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proyecto_Senda_01] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto_Senda_01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto_Senda_01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto_Senda_01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto_Senda_01] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Proyecto_Senda_01]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 14/10/2017 04:43:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[IdCiente] [uniqueidentifier] NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Sexo] [varchar](1) NULL,
	[FechaNacimiento] [date] NULL,
	[Telefono] [varchar](15) NULL,
	[Correo] [varchar](50) NULL,
	[IdMunicipio] [uniqueidentifier] NULL,
	[RFC] [varchar](50) NULL,
	[IdPreventa] [uniqueidentifier] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 14/10/2017 04:43:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estado](
	[IdEstado] [uniqueidentifier] NULL,
	[IdPais] [uniqueidentifier] NULL,
	[NombreEstado] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 14/10/2017 04:43:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Municipio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Municipio](
	[IdMunicipio] [uniqueidentifier] NULL,
	[IdEstado] [uniqueidentifier] NULL,
	[NombreMunicipio] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 14/10/2017 04:43:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pais]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pais](
	[IdPais] [uniqueidentifier] NULL,
	[NombrePais] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Preventa]    Script Date: 14/10/2017 04:43:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Preventa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Preventa](
	[IdSucursal] [uniqueidentifier] NULL,
	[CanBoleto] [int] NULL,
	[EstadoPreventa] [varchar](1) NULL,
	[IdCliente] [uniqueidentifier] NULL,
	[TotalPreventa] [int] NULL,
	[Descuento] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 14/10/2017 04:43:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [uniqueidentifier] NULL,
	[IdMunicipio] [uniqueidentifier] NULL,
	[NombreSucursal] [varchar](50) NULL,
	[ClaveSucursal] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 14/10/2017 04:43:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendedor](
	[IdVendedor] [uniqueidentifier] NULL,
	[NombreVendedor] [varchar](50) NULL,
	[NumeroSeguro] [varchar](50) NULL,
	[IdSucursal] [uniqueidentifier] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 14/10/2017 04:43:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Venta](
	[IdPais] [uniqueidentifier] NULL,
	[IdVendedor] [uniqueidentifier] NULL,
	[EstadoVenta] [varchar](1) NULL,
	[IdSucursal] [uniqueidentifier] NULL,
	[CanBoleto] [int] NULL,
	[PrecioTotal] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Proyecto_Senda_01] SET  READ_WRITE 
GO
