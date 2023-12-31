USE [master]
GO
/****** Object:  Database [DVP]    Script Date: 15/12/2023 6:16:26 p. m. ******/
CREATE DATABASE [DVP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DVP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DVP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DVP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DVP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DVP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DVP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DVP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DVP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DVP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DVP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DVP] SET ARITHABORT OFF 
GO
ALTER DATABASE [DVP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DVP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DVP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DVP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DVP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DVP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DVP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DVP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DVP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DVP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DVP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DVP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DVP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DVP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DVP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DVP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DVP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DVP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DVP] SET  MULTI_USER 
GO
ALTER DATABASE [DVP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DVP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DVP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DVP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DVP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DVP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DVP] SET QUERY_STORE = OFF
GO
USE [DVP]
GO
/****** Object:  Table [dbo].[EntidadPersonas]    Script Date: 15/12/2023 6:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntidadPersonas](
	[Identificador] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[NumeroIdentificacion] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[TipoIdentificacion] [varchar](20) NULL,
	[FechaCreacion] [datetime] NULL,
	[IdentificacíonCompleta]  AS (concat([TipoIdentificacion],'-',[NumeroIdentificacion])),
	[NombreCompleto]  AS (concat([Nombres],' ',[Apellidos])),
	[NuevaContrasena] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Identificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntidadUsuario]    Script Date: 15/12/2023 6:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntidadUsuario](
	[Identificador] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Identificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EntidadPersonas] ON 

INSERT [dbo].[EntidadPersonas] ([Identificador], [Nombres], [Apellidos], [NumeroIdentificacion], [Email], [TipoIdentificacion], [FechaCreacion], [NuevaContrasena]) VALUES (1, N'Yessid Danilo', N'Pulgarin Lopez', N'1006321767', N'yessid@dvp.com', N'1', CAST(N'2023-12-15T16:55:27.123' AS DateTime), N'1234')
SET IDENTITY_INSERT [dbo].[EntidadPersonas] OFF
GO
SET IDENTITY_INSERT [dbo].[EntidadUsuario] ON 

INSERT [dbo].[EntidadUsuario] ([Identificador], [Usuario], [Pass], [FechaCreacion]) VALUES (1, N'yessid@dvp.com', N'1234', CAST(N'2023-12-15T16:55:28.170' AS DateTime))
SET IDENTITY_INSERT [dbo].[EntidadUsuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__EntidadU__E3237CF711C2D36C]    Script Date: 15/12/2023 6:16:28 p. m. ******/
ALTER TABLE [dbo].[EntidadUsuario] ADD UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EntidadPersonas] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[EntidadUsuario] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPersonas]    Script Date: 15/12/2023 6:16:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CREACIÓN DE UN STORE PROCEDURE PARA CONSULTAR LAS PERSONAS CREADAS

CREATE PROCEDURE [dbo].[ConsultarPersonas]
AS
BEGIN
    SELECT * FROM EntidadPersonas;
END

GO
USE [master]
GO
ALTER DATABASE [DVP] SET  READ_WRITE 
GO
