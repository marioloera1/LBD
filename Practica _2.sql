USE [master]
GO
/****** Object:  Database [Senda_Proyecto]    Script Date: 16/09/2017 04:10:29 a. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Senda_Proyecto')
BEGIN
CREATE DATABASE [Senda_Proyecto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Senda_Proyecto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Senda_Proyecto.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Senda_Proyecto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Senda_Proyecto_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [Senda_Proyecto] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Senda_Proyecto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Senda_Proyecto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Senda_Proyecto] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Senda_Proyecto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Senda_Proyecto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Senda_Proyecto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Senda_Proyecto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Senda_Proyecto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Senda_Proyecto] SET  MULTI_USER 
GO
ALTER DATABASE [Senda_Proyecto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Senda_Proyecto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Senda_Proyecto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Senda_Proyecto] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Senda_Proyecto]
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 16/09/2017 04:10:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Boleto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Boleto](
	[IdBoleto] [uniqueidentifier] NOT NULL,
	[Zona] [varchar](20) NULL,
	[NumeroAsiento] [int] NOT NULL,
	[NumeroFila] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[FechaCompra] [date] NULL,
	[FechaViaje] [date] NULL,
	[Descuento] [money] NOT NULL,
	[PrecioTotal]  AS ([Precio]-[Descuento]),
	[TiempoCompra]  AS (datediff(hour,[FechaCompra],getdate())),
	[TiempoRestanteSalida]  AS (datediff(hour,getdate(),[FechaViaje]))
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Camion]    Script Date: 16/09/2017 04:10:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Camion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Camion](
	[IdCamion] [uniqueidentifier] NOT NULL,
	[ModeloCamion] [varchar](50) NULL,
	[EstadoActual] [varchar](1) NULL,
	[Placas] [varchar](20) NULL,
	[Capacidad] [int] NOT NULL,
	[AsientosOcupados] [int] NOT NULL,
	[AsientosPreferentes] [int] NOT NULL,
	[AsientosDisponibles]  AS ([Capacidad]-[AsientosOcupados]),
	[AsientosDisponiblesTotal]  AS (([Capacidad]-[AsientosOcupados])-[AsientosPreferentes]),
	[ViajesDia] [int] NOT NULL,
	[TotalPasajerosDia]  AS ([ViajesDia]*[AsientosOcupados])
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 16/09/2017 04:10:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Telefono] [varchar](10) NULL,
	[FechaNacimiento] [date] NULL,
	[Edad]  AS (datediff(year,[FechaNacimiento],getdate())),
	[CorreoE] [varchar](50) NULL,
	[NombreCompleto]  AS ([Nombre]+[Apellido])
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 16/09/2017 04:10:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pago](
	[FormaPago] [varchar](50) NULL,
	[PrecioBoleto] [money] NOT NULL,
	[ZonaCamion] [varchar](20) NULL,
	[Descuento] [money] NOT NULL,
	[Recargos] [money] NOT NULL,
	[Pago] [money] NOT NULL,
	[PrecioDescuento]  AS ([PrecioBoleto]-[Descuento]),
	[PrecioTotal]  AS (([PrecioBoleto]-[Descuento])+[Recargos]),
	[Cambio]  AS ([Pago]-(([PrecioBoleto]-[Descuento])+[Recargos]))
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservacion]    Script Date: 16/09/2017 04:10:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reservacion](
	[FechaReservacion] [date] NOT NULL,
	[CambiarFecha] [date] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[IdCliente] [uniqueidentifier] NOT NULL,
	[FormaPago] [varchar](50) NULL,
	[LugarDestino] [varchar](50) NULL,
	[NombreCompleto]  AS ([Nombre]+[Apellido]),
	[TiempoParaReservacion]  AS (datediff(hour,getdate(),[FechaReservacion])),
	[TiempoNuevoReservacion]  AS (datediff(hour,getdate(),[FechaReservacion]))
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 16/09/2017 04:10:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ruta](
	[IdViaje] [uniqueidentifier] NOT NULL,
	[IdCamion] [uniqueidentifier] NOT NULL,
	[IdRuta] [uniqueidentifier] NOT NULL,
	[FechaSalida] [date] NULL,
	[FechaLlegada] [date] NULL,
	[LugarSalida] [varchar](50) NULL,
	[LugarDestino] [varchar](50) NULL,
	[Costo] [money] NOT NULL,
	[Descuento] [money] NOT NULL,
	[Recargos] [money] NOT NULL,
	[TiempoViaje]  AS (datediff(hour,[FechaSalida],[FechaLlegada])),
	[PrecioDescuento]  AS ([Costo]-[Descuento]),
	[PrecioFinal]  AS (([Costo]-[Descuento])+[Recargos])
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 16/09/2017 04:10:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Viaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Viaje](
	[TipoViaje] [varchar](50) NULL,
	[FechaSalida] [date] NULL,
	[FechaLlegada] [date] NULL,
	[TiempoViaje]  AS (datediff(hour,[FechaSalida],[FechaLlegada])),
	[NumeroViaje] [int] NOT NULL,
	[LugarSalida] [varchar](50) NULL,
	[LugarDestino] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [OrdenCliente]    Script Date: 16/09/2017 04:10:29 a. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND name = N'OrdenCliente')
CREATE NONCLUSTERED INDEX [OrdenCliente] ON [dbo].[Cliente]
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Senda_Proyecto] SET  READ_WRITE 
GO
