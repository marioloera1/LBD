USE [master]
GO
/****** Object:  Database [Proyecto_Senda_01]    Script Date: 22/10/2017 12:52:50 p. m. ******/
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
/****** Object:  Table [dbo].[CamionSENDA]    Script Date: 22/10/2017 12:52:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CamionSENDA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CamionSENDA](
	[IdCamion] [uniqueidentifier] NULL,
	[Modelo] [varchar](50) NULL,
	[placas] [uniqueidentifier] NULL,
	[status] [varchar](1) NULL,
	[numAsientos] [int] NULL,
	[clase] [varchar](40) NULL,
	[IdChofer] [uniqueidentifier] NULL,
	[numCamion] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 22/10/2017 12:52:50 p. m. ******/
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
/****** Object:  Table [dbo].[destino]    Script Date: 22/10/2017 12:52:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[destino]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[destino](
	[IdSucursal] [uniqueidentifier] NULL,
	[IdDestino] [uniqueidentifier] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 22/10/2017 12:52:50 p. m. ******/
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
/****** Object:  Table [dbo].[Municipio]    Script Date: 22/10/2017 12:52:50 p. m. ******/
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
/****** Object:  Table [dbo].[origen]    Script Date: 22/10/2017 12:52:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[origen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[origen](
	[IdSucursal] [uniqueidentifier] NULL,
	[IdOrigen] [uniqueidentifier] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 22/10/2017 12:52:50 p. m. ******/
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
/****** Object:  Table [dbo].[pasagero]    Script Date: 22/10/2017 12:52:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pasagero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[pasagero](
	[IdPasajero] [uniqueidentifier] NULL,
	[nombre] [varchar](40) NULL,
	[apellidos] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Preventa]    Script Date: 22/10/2017 12:52:50 p. m. ******/
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
/****** Object:  Table [dbo].[ruta]    Script Date: 22/10/2017 12:52:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ruta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ruta](
	[IdRuta] [uniqueidentifier] NULL,
	[IdOrigen] [uniqueidentifier] NULL,
	[IdDestino] [uniqueidentifier] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 22/10/2017 12:52:50 p. m. ******/
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
/****** Object:  Table [dbo].[Vendedor]    Script Date: 22/10/2017 12:52:50 p. m. ******/
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
/****** Object:  Table [dbo].[Venta]    Script Date: 22/10/2017 12:52:50 p. m. ******/
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
INSERT [dbo].[CamionSENDA] ([IdCamion], [Modelo], [placas], [status], [numAsientos], [clase], [IdChofer], [numCamion]) VALUES (N'bff5a4e5-85cf-477d-a845-073cbcb02cfa', N'M900', N'a77c9777-0140-493a-941c-cf2d1566e759', N'A', 56, N'VIP', N'f9445569-9f3c-42c1-8a5c-5cced943a198', 1231)
INSERT [dbo].[CamionSENDA] ([IdCamion], [Modelo], [placas], [status], [numAsientos], [clase], [IdChofer], [numCamion]) VALUES (N'7d318502-47c1-4398-ab5e-502460230242', N'CMN01', N'681ca245-edee-4dfa-9673-7048fd8cbb08', N'A', 56, N'VIP', N'49323524-e211-4f91-8c05-e19d076e3ca6', 1232)
INSERT [dbo].[CamionSENDA] ([IdCamion], [Modelo], [placas], [status], [numAsientos], [clase], [IdChofer], [numCamion]) VALUES (N'c3601117-e0f4-416c-9350-b6d4a057ed6a', N'CMN02', N'141dd385-1286-45d7-bacc-0a43de7f321c', N'A', 56, N'VIP', N'83fa52c9-58d3-4ae3-ac67-31a947fc3ece', 1233)
INSERT [dbo].[CamionSENDA] ([IdCamion], [Modelo], [placas], [status], [numAsientos], [clase], [IdChofer], [numCamion]) VALUES (N'116bdc8c-daa0-45d6-8115-41f0c0410d88', N'CMN04', N'020455f5-b053-4225-aa89-0ed8beeae54e', N'A', 56, N'VIP', N'450ca8ee-eaf2-47b1-bd0f-d3756d1fe2e5', 1235)
INSERT [dbo].[Cliente] ([IdCiente], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [Telefono], [Correo], [IdMunicipio], [RFC], [IdPreventa]) VALUES (N'5fcec955-e14b-4f5f-a05a-499b8c8b5a0f', N'Mario', N'Loera', N'H', CAST(0xF9180B00 AS Date), N'22222333', N'marioloera@gmail.com', N'7956c3ab-7f96-4c95-b729-ee37b8da4fad', N'MARIO01', N'f2c697ff-845e-4f28-80cc-37372bc5d7da')
INSERT [dbo].[Cliente] ([IdCiente], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [Telefono], [Correo], [IdMunicipio], [RFC], [IdPreventa]) VALUES (N'6256fb56-7ae6-405f-be39-2072ef862c4f', N'Raul', N'Herrera', N'H', CAST(0xA8200B00 AS Date), N'12345679', N'raul@gmail.com', N'12005a9a-2764-4fcb-afaf-cd0228cdcff3', N'RAUL02', N'74d56966-973f-4928-94c9-63367b86c9e3')
INSERT [dbo].[Cliente] ([IdCiente], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [Telefono], [Correo], [IdMunicipio], [RFC], [IdPreventa]) VALUES (N'853c4a83-25d5-47ea-b62c-c0d4a22cd92d', N'Salvador', N'Ledesma', N'H', CAST(0x82200B00 AS Date), N'12345680', N'salvador@gmail.com', N'c75481dd-dc9e-48aa-a4b6-204cff6a49fe', N'SALVADOR03', N'76861b9b-ce6c-4b63-b6eb-8fb9560d4a80')
INSERT [dbo].[Cliente] ([IdCiente], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [Telefono], [Correo], [IdMunicipio], [RFC], [IdPreventa]) VALUES (N'71c9a5bb-b202-40e7-b32e-216a0a050ec9', N'Alexis', N'Militar', N'H', CAST(0x12170B00 AS Date), N'12345681', N'elmilitar@gmail.com', N'1d05e8f7-6a43-4f16-80a2-747461bec586', N'MILITAR04', N'f9e36d3b-d02e-45b4-b715-cb77736400ae')
INSERT [dbo].[Cliente] ([IdCiente], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [Telefono], [Correo], [IdMunicipio], [RFC], [IdPreventa]) VALUES (N'296db431-cdce-4033-90d8-102023efb97f', N'Alexis', N'Guapo', N'H', CAST(0x0A070A00 AS Date), N'12345682', N'estoyguapo@gmail.com', N'4cf93aa2-ec1b-45e5-a576-76553fb0e69d', N'GUAPO01', N'51cb18dd-bb0b-435c-bc25-bd1b0d019999')
INSERT [dbo].[destino] ([IdSucursal], [IdDestino]) VALUES (N'4fe2e23d-dfef-40f8-919c-59a84dd6e2cd', N'6345bd73-50de-4dc6-acb5-91cf9627aa01')
INSERT [dbo].[destino] ([IdSucursal], [IdDestino]) VALUES (N'6a26e9dd-4a28-4480-a163-bf0ea3536e54', N'6d7d1f27-778d-43d7-ad0d-6ecdcee0878c')
INSERT [dbo].[destino] ([IdSucursal], [IdDestino]) VALUES (N'4c607613-9b38-4c23-af23-124992f89e8c', N'424ead26-17c3-4f2a-a5fc-674c18f83617')
INSERT [dbo].[destino] ([IdSucursal], [IdDestino]) VALUES (N'3e5d4e31-df5d-4091-8472-0a6e3ba9982d', N'725f6e95-b166-48e1-aa40-bccd94c25000')
INSERT [dbo].[destino] ([IdSucursal], [IdDestino]) VALUES (N'a39c98c9-0f87-4ac2-9124-b7aa39e211e0', N'40b8fd90-81d5-4f0d-8dea-4095b374475e')
INSERT [dbo].[Estado] ([IdEstado], [IdPais], [NombreEstado]) VALUES (N'2bd8b128-64b6-42e1-87f4-c99c39652ec8', N'2f50b6c0-fa1a-43b2-a103-54ee5060231b', N'Nuevo Leon')
INSERT [dbo].[Estado] ([IdEstado], [IdPais], [NombreEstado]) VALUES (N'dfae68b8-d226-4230-94a2-a0f1dab01d55', N'65047b76-85f3-47ba-986e-43cc41478287', N'Tamaulipas')
INSERT [dbo].[Estado] ([IdEstado], [IdPais], [NombreEstado]) VALUES (N'4e9ca7d1-99d1-494c-93c5-03b19de90f63', N'dba71f80-476e-4cd4-b331-fede87c72a5d', N'Coahuila')
INSERT [dbo].[Estado] ([IdEstado], [IdPais], [NombreEstado]) VALUES (N'2ba84021-f0fc-4972-ae2c-e990d2bd906e', N'e2e2a122-9479-4e86-8532-d392a0bc626f', N'Chihuahua')
INSERT [dbo].[Estado] ([IdEstado], [IdPais], [NombreEstado]) VALUES (N'32af32aa-0a7b-4976-a593-5fb27d7d11f1', N'3a421888-4d88-45b5-ad3a-9b6d685c3aee', N'Sonora')
INSERT [dbo].[Municipio] ([IdMunicipio], [IdEstado], [NombreMunicipio]) VALUES (N'84482cf6-5c56-43b8-9e88-e7623b02b062', N'89771ede-fa4e-40b9-8aca-950455929e6d', N'Garcia')
INSERT [dbo].[Municipio] ([IdMunicipio], [IdEstado], [NombreMunicipio]) VALUES (N'f38f26e3-bec1-486d-a124-5775b6606fcb', N'19d718a4-d215-4293-b23d-1da1603cfd3e', N'Tampico')
INSERT [dbo].[Municipio] ([IdMunicipio], [IdEstado], [NombreMunicipio]) VALUES (N'2c02b730-9deb-42ce-a145-5ecf40313e95', N'5f129039-e474-4d3c-a05f-12e15e75c352', N'Saltillo')
INSERT [dbo].[Municipio] ([IdMunicipio], [IdEstado], [NombreMunicipio]) VALUES (N'e7ddc152-93c8-40eb-9b04-2c11a7b68805', N'a5ea72c2-3728-4145-86c8-99f6b44cb110', N'Chihuahua')
INSERT [dbo].[Municipio] ([IdMunicipio], [IdEstado], [NombreMunicipio]) VALUES (N'ab9196a4-75b8-40e3-87ca-48d04d647d5f', N'8dd1bf16-259d-40df-b561-1ede630e0e9b', N'Guaymas')
INSERT [dbo].[origen] ([IdSucursal], [IdOrigen]) VALUES (N'd5cfd3ea-3799-4885-8261-80318e1cf5b9', N'bc2b845b-9e9a-4e01-904d-45ce7ab5bcf2')
INSERT [dbo].[origen] ([IdSucursal], [IdOrigen]) VALUES (N'48bc1abe-4ec3-4e4f-8774-b57aad1f34d0', N'451f8921-6d17-4c7e-b33f-5588f53a209d')
INSERT [dbo].[origen] ([IdSucursal], [IdOrigen]) VALUES (N'38cf04a3-d63b-4f9f-902f-a0f7c9fa555f', N'abfda5d5-52b7-40f5-a1fa-4cd701bf1fb6')
INSERT [dbo].[origen] ([IdSucursal], [IdOrigen]) VALUES (N'88f78c56-0268-441c-92cd-271868a2ed52', N'9af59c27-d147-436a-9a12-f98541388eb4')
INSERT [dbo].[origen] ([IdSucursal], [IdOrigen]) VALUES (N'ef209a61-1dc3-46e1-97a6-172138e3d84b', N'b63c7755-81ac-43a0-b4ec-471af5aed75e')
INSERT [dbo].[Pais] ([IdPais], [NombrePais]) VALUES (N'8a09b1ae-be18-4eea-b5b7-5624acd98062', N'Mexico')
INSERT [dbo].[Pais] ([IdPais], [NombrePais]) VALUES (N'fb7d6d7c-65fa-4d84-9ee8-aa4729160d30', N'Estados Unidos de America')
INSERT [dbo].[Pais] ([IdPais], [NombrePais]) VALUES (N'd1a6df1f-a027-40f4-9457-3d62af594529', N'Venezuela')
INSERT [dbo].[Pais] ([IdPais], [NombrePais]) VALUES (N'17eb8d29-55ff-492b-9821-473662503467', N'Guatemala')
INSERT [dbo].[pasagero] ([IdPasajero], [nombre], [apellidos]) VALUES (N'ed8683bc-ca1a-4202-b129-7f379f2607ab', N'Alondra Carolina', N'Gomez Manzanares')
INSERT [dbo].[pasagero] ([IdPasajero], [nombre], [apellidos]) VALUES (N'0f47650a-580e-4edd-85ed-d86ade76ed4a', N'Raul', N'Herrera')
INSERT [dbo].[pasagero] ([IdPasajero], [nombre], [apellidos]) VALUES (N'7b02e5e5-f0ad-42b2-a26c-ed413c17be57', N'Salvador ', N'Ledezma')
INSERT [dbo].[pasagero] ([IdPasajero], [nombre], [apellidos]) VALUES (N'8c7cde9a-7523-4b58-ba6a-40effc408b64', N'Alexis', N'Militar')
INSERT [dbo].[pasagero] ([IdPasajero], [nombre], [apellidos]) VALUES (N'3934c223-8478-4555-9ffd-00b880fac497', N'Alexis', N'Guapo')
INSERT [dbo].[Preventa] ([IdSucursal], [CanBoleto], [EstadoPreventa], [IdCliente], [TotalPreventa], [Descuento]) VALUES (N'93ee5409-c0f7-45ad-abf6-d72aa8a4ae37', 2, N'A', N'30252851-2667-456b-8cfe-c55148b4cec9', 123, 21)
INSERT [dbo].[Preventa] ([IdSucursal], [CanBoleto], [EstadoPreventa], [IdCliente], [TotalPreventa], [Descuento]) VALUES (N'd1086619-dd65-431f-b6a4-e6d3ba4e0487', 3, N'A', N'd2f854cc-335b-4d18-a644-f966079a83c1', 150, 22)
INSERT [dbo].[Preventa] ([IdSucursal], [CanBoleto], [EstadoPreventa], [IdCliente], [TotalPreventa], [Descuento]) VALUES (N'3f1e5b0f-3f48-4bc1-a214-37e78c0ac375', 1, N'A', N'dff48d71-b730-4965-b43b-a2a5b8db7242', 74, 0)
INSERT [dbo].[Preventa] ([IdSucursal], [CanBoleto], [EstadoPreventa], [IdCliente], [TotalPreventa], [Descuento]) VALUES (N'347b30e2-49a6-4f41-aacb-985f295b1983', 3, N'A', N'579b3423-4dfd-43d2-ac09-d591225fa954', 150, 22)
INSERT [dbo].[ruta] ([IdRuta], [IdOrigen], [IdDestino]) VALUES (N'f483da0d-7c7b-4010-a557-bc9939150c49', N'e2bc3f5d-1642-4a80-a8a1-d9246486ee60', N'ee3d5baf-9320-4c92-a84a-a30066c5bd82')
INSERT [dbo].[ruta] ([IdRuta], [IdOrigen], [IdDestino]) VALUES (N'f54d2642-46ea-48d6-bf9f-bdd6c54ca138', N'c9d12009-3cdd-4131-b97c-81092326eac1', N'5914cb0f-5578-4d5a-985a-cc7a3c21611e')
INSERT [dbo].[ruta] ([IdRuta], [IdOrigen], [IdDestino]) VALUES (N'76ba05ee-f4d5-4bae-ad98-705007f7866d', N'4d1988ff-db89-46ae-86ff-c3a266be9f85', N'79be6ac4-b13b-463c-9293-0efb292ab982')
INSERT [dbo].[ruta] ([IdRuta], [IdOrigen], [IdDestino]) VALUES (N'666c847b-54a0-4bd1-9763-1509fa89a645', N'4f763df9-d1bb-444d-8b98-c07b91891c55', N'909b0d52-0b52-4db3-8568-bf97d5488475')
INSERT [dbo].[ruta] ([IdRuta], [IdOrigen], [IdDestino]) VALUES (N'07d4a18d-a135-41da-ba90-81bfbeff544c', N'5d66897b-de9f-4487-a693-898fc3e4647e', N'6a256cc2-b7da-4659-9a56-f23ec48bcb34')
INSERT [dbo].[Sucursal] ([IdSucursal], [IdMunicipio], [NombreSucursal], [ClaveSucursal]) VALUES (N'112d9f6a-5c8e-49b6-97d2-af7e1c8b55cf', N'5cd8c396-4d50-4e73-933d-9ca3fd255224', N'NORTE', N'NORTE01')
INSERT [dbo].[Sucursal] ([IdSucursal], [IdMunicipio], [NombreSucursal], [ClaveSucursal]) VALUES (N'c80e0e20-c464-47a9-9ce6-de35e6f0590a', N'e699355d-06ec-4eec-933e-946fdb5512e5', N'CENTRO', N'CENTRO02')
INSERT [dbo].[Sucursal] ([IdSucursal], [IdMunicipio], [NombreSucursal], [ClaveSucursal]) VALUES (N'5fe27935-7ace-4854-8262-f395a48938c8', N'56a0d80b-ab7a-4540-bce6-f3dfe294be5d', N'SUR', N'SUR03')
INSERT [dbo].[Sucursal] ([IdSucursal], [IdMunicipio], [NombreSucursal], [ClaveSucursal]) VALUES (N'37a237b8-fc02-443f-ba3a-779ce14a1f11', N'27cfd47e-0135-49f1-a548-1931ef64ac29', N'ESTE', N'ESTE04')
INSERT [dbo].[Sucursal] ([IdSucursal], [IdMunicipio], [NombreSucursal], [ClaveSucursal]) VALUES (N'2f36f01f-617e-4eb0-8cfe-35dc50965234', N'57dcb2f5-81f7-4e42-8f4f-431dc0ce292e', N'OESTE', N'OESTE05')
INSERT [dbo].[Vendedor] ([IdVendedor], [NombreVendedor], [NumeroSeguro], [IdSucursal]) VALUES (N'00917e2d-f719-4337-ad94-ccabe4ead22a', N'Laura', N'44455', N'28a442c8-ada2-47a3-84f5-bc61303b268c')
INSERT [dbo].[Vendedor] ([IdVendedor], [NombreVendedor], [NumeroSeguro], [IdSucursal]) VALUES (N'c4a7cfdd-d947-47d5-a0f0-88f7f0d82dc6', N'Isis', N'23456', N'091edccf-847d-42a5-863d-cfa87ea01f2d')
INSERT [dbo].[Vendedor] ([IdVendedor], [NombreVendedor], [NumeroSeguro], [IdSucursal]) VALUES (N'48062f96-869c-47ea-93c9-49d54e0b9cc1', N'Ana', N'34567', N'e3fdaed4-bb8d-4b03-a2ab-17e621512094')
INSERT [dbo].[Vendedor] ([IdVendedor], [NombreVendedor], [NumeroSeguro], [IdSucursal]) VALUES (N'14014b11-6f3d-498f-88c5-b90bb8faf7b8', N'Erick', N'56789', N'8ac5c6b1-7d49-417e-a1b1-1933b194896b')
INSERT [dbo].[Venta] ([IdPais], [IdVendedor], [EstadoVenta], [IdSucursal], [CanBoleto], [PrecioTotal]) VALUES (N'07c27e44-79e8-4473-99a5-090f827b9a2b', N'9221b31c-8517-492c-ba65-9ba637ef7d3b', N'A', N'8b3e661b-ccd3-4b71-955b-a4cd0eb1433a', 2, 102)
INSERT [dbo].[Venta] ([IdPais], [IdVendedor], [EstadoVenta], [IdSucursal], [CanBoleto], [PrecioTotal]) VALUES (N'55fe0bdf-18e8-4571-9ea5-32ee50abb2c9', N'08513c7a-ca6d-4695-ada5-2872114e648b', N'A', N'fbfa2e34-5e18-404e-8ee0-81d938ca06c0', 3, 128)
INSERT [dbo].[Venta] ([IdPais], [IdVendedor], [EstadoVenta], [IdSucursal], [CanBoleto], [PrecioTotal]) VALUES (N'cd546c2c-8136-4861-abd5-d00ae00092d5', N'9af19b37-4c6f-4362-98c2-7958f1ddbea4', N'A', N'2759ffae-40c8-42ac-a69b-2e80072efc15', 1, 74)
INSERT [dbo].[Venta] ([IdPais], [IdVendedor], [EstadoVenta], [IdSucursal], [CanBoleto], [PrecioTotal]) VALUES (N'73c30c73-934b-4459-83b7-827d8253eb6e', N'c5540e37-2da5-43b7-a485-6502efd8b893', N'A', N'f9af4a1b-549b-477b-b5f8-9cfeab122776', 3, 128)
USE [master]
GO
ALTER DATABASE [Proyecto_Senda_01] SET  READ_WRITE 
GO
