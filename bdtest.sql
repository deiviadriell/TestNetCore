USE [master]
GO
/****** Object:  Database [BDTestAPI]    Script Date: 04/04/2022 11:21:38 ******/
CREATE DATABASE [BDTestAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDTestAPI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BDTestAPI.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDTestAPI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BDTestAPI_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDTestAPI] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDTestAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDTestAPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDTestAPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDTestAPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDTestAPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDTestAPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDTestAPI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDTestAPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDTestAPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDTestAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDTestAPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDTestAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDTestAPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDTestAPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDTestAPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDTestAPI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDTestAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDTestAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDTestAPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDTestAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDTestAPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDTestAPI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDTestAPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDTestAPI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDTestAPI] SET  MULTI_USER 
GO
ALTER DATABASE [BDTestAPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDTestAPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDTestAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDTestAPI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BDTestAPI] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BDTestAPI]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 04/04/2022 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[clienteid] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [nvarchar](200) NULL,
	[genero] [int] NULL,
	[edad] [int] NULL,
	[direccion] [nvarchar](200) NULL,
	[telefono] [nvarchar](10) NULL,
	[identificacion] [nvarchar](10) NULL,
	[clave] [nvarchar](100) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[clienteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 04/04/2022 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[idCuenta] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[idTipoCuenta] [int] NULL,
	[limiteRetiroDiario] [money] NULL,
	[numero] [nvarchar](100) NULL,
	[saldoInicial] [money] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[idCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 04/04/2022 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[idMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[idCuenta] [int] NULL,
	[idTipoMovimiento] [int] NULL,
	[fecha] [date] NULL,
	[valor] [money] NULL,
	[saldo] [money] NULL,
 CONSTRAINT [PK_Movimientos] PRIMARY KEY CLUSTERED 
(
	[idMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuenta]    Script Date: 04/04/2022 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCuenta](
	[idTipoCuenta] [int] IDENTITY(1,1) NOT NULL,
	[tipoCuenta] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoCuenta] PRIMARY KEY CLUSTERED 
(
	[idTipoCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 04/04/2022 11:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[idTipoMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[tipoMovimiento] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[idTipoMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([clienteid], [nombres], [genero], [edad], [direccion], [telefono], [identificacion], [clave], [estado]) VALUES (1, N'3', NULL, NULL, NULL, NULL, NULL, N'123454', 1)
INSERT [dbo].[Cliente] ([clienteid], [nombres], [genero], [edad], [direccion], [telefono], [identificacion], [clave], [estado]) VALUES (2, N'1', NULL, NULL, NULL, NULL, NULL, N'123454', 1)
INSERT [dbo].[Cliente] ([clienteid], [nombres], [genero], [edad], [direccion], [telefono], [identificacion], [clave], [estado]) VALUES (3, N'21212', 0, 12121, N'', N'', N'sasa', N'', 1)
INSERT [dbo].[Cliente] ([clienteid], [nombres], [genero], [edad], [direccion], [telefono], [identificacion], [clave], [estado]) VALUES (4, N'David Zamorano', 0, 15, N'Quevedo', N'0969311092', N'0503306169', N'212121', 1)
INSERT [dbo].[Cliente] ([clienteid], [nombres], [genero], [edad], [direccion], [telefono], [identificacion], [clave], [estado]) VALUES (5, N'Camila Arellano', 0, -4, N'wqwq', N'1212', N'12121', N'1121212', 1)
INSERT [dbo].[Cliente] ([clienteid], [nombres], [genero], [edad], [direccion], [telefono], [identificacion], [clave], [estado]) VALUES (6, N'sasa', 0, 52, N'Quevedo', N'0969311092', N'1221', N'21212121', 1)
INSERT [dbo].[Cliente] ([clienteid], [nombres], [genero], [edad], [direccion], [telefono], [identificacion], [clave], [estado]) VALUES (7, N'Luisa Armandillo', 0, 19, N'Quevedo', N'0969352017', N'0502214752', N'1234', 1)
INSERT [dbo].[Cliente] ([clienteid], [nombres], [genero], [edad], [direccion], [telefono], [identificacion], [clave], [estado]) VALUES (8, N'SASAS', 0, 12121, N'', N'', N'', N'', 1)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Cuenta] ON 

INSERT [dbo].[Cuenta] ([idCuenta], [idCliente], [idTipoCuenta], [limiteRetiroDiario], [numero], [saldoInicial], [estado]) VALUES (1, 1, 1, 100.0000, N'string', 100.0000, 1)
INSERT [dbo].[Cuenta] ([idCuenta], [idCliente], [idTipoCuenta], [limiteRetiroDiario], [numero], [saldoInicial], [estado]) VALUES (4, 4, 1, 100.0000, N'12121', 100.0000, 1)
INSERT [dbo].[Cuenta] ([idCuenta], [idCliente], [idTipoCuenta], [limiteRetiroDiario], [numero], [saldoInicial], [estado]) VALUES (5, 7, 2, 100.0000, N'101010', 1000.0000, 1)
SET IDENTITY_INSERT [dbo].[Cuenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Movimientos] ON 

INSERT [dbo].[Movimientos] ([idMovimiento], [idCuenta], [idTipoMovimiento], [fecha], [valor], [saldo]) VALUES (1, 1, 1, CAST(N'2022-03-31' AS Date), 100.0000, 150.0000)
INSERT [dbo].[Movimientos] ([idMovimiento], [idCuenta], [idTipoMovimiento], [fecha], [valor], [saldo]) VALUES (2, 4, 1, CAST(N'2022-04-04' AS Date), 100.0000, -100.0000)
INSERT [dbo].[Movimientos] ([idMovimiento], [idCuenta], [idTipoMovimiento], [fecha], [valor], [saldo]) VALUES (3, 4, 1, CAST(N'2022-04-04' AS Date), 50.0000, -150.0000)
SET IDENTITY_INSERT [dbo].[Movimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoCuenta] ON 

INSERT [dbo].[TipoCuenta] ([idTipoCuenta], [tipoCuenta]) VALUES (1, N'Ahorros')
INSERT [dbo].[TipoCuenta] ([idTipoCuenta], [tipoCuenta]) VALUES (2, N'Correinte')
SET IDENTITY_INSERT [dbo].[TipoCuenta] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMovimiento] ON 

INSERT [dbo].[TipoMovimiento] ([idTipoMovimiento], [tipoMovimiento]) VALUES (1, N'Deposito')
SET IDENTITY_INSERT [dbo].[TipoMovimiento] OFF
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([clienteid])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Cliente]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_TipoCuenta] FOREIGN KEY([idTipoCuenta])
REFERENCES [dbo].[TipoCuenta] ([idTipoCuenta])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_TipoCuenta]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Cuenta] FOREIGN KEY([idCuenta])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Cuenta]
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_TipoMovimiento] FOREIGN KEY([idTipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([idTipoMovimiento])
GO
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_TipoMovimiento]
GO
USE [master]
GO
ALTER DATABASE [BDTestAPI] SET  READ_WRITE 
GO
