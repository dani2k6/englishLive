USE [master]
GO
/****** Object:  Database [udeodb]    Script Date: 12-Jun-19 5:00:45 PM ******/
CREATE DATABASE [udeodb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'udeodb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\udeodb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'udeodb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\udeodb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [udeodb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [udeodb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [udeodb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [udeodb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [udeodb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [udeodb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [udeodb] SET ARITHABORT OFF 
GO
ALTER DATABASE [udeodb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [udeodb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [udeodb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [udeodb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [udeodb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [udeodb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [udeodb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [udeodb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [udeodb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [udeodb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [udeodb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [udeodb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [udeodb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [udeodb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [udeodb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [udeodb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [udeodb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [udeodb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [udeodb] SET  MULTI_USER 
GO
ALTER DATABASE [udeodb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [udeodb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [udeodb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [udeodb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [udeodb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [udeodb]
GO
/****** Object:  Table [dbo].[cursos]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cursos](
	[idcursos] [int] NOT NULL,
	[idnivel] [int] NULL,
	[duracion] [varchar](45) NULL,
	[idsedes] [int] NULL,
	[idprogramas] [varchar](45) NULL,
	[docentes_iddocente] [int] NOT NULL,
	[precios_idprecio_servicios] [int] NOT NULL,
 CONSTRAINT [primary3] PRIMARY KEY CLUSTERED 
(
	[idcursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[iddetalle] [int] NOT NULL,
	[idmeses] [int] NULL,
	[idcursos] [int] NULL,
	[idprecio_servicios] [int] NULL,
	[idcobros] [int] NOT NULL,
 CONSTRAINT [primary8] PRIMARY KEY CLUSTERED 
(
	[iddetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_insumos]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_insumos](
	[iddetalle_insumos] [int] NOT NULL,
	[idventas] [int] NULL,
	[idlibros] [int] NULL,
	[idcursos] [int] NULL,
	[idprecio] [int] NULL,
 CONSTRAINT [primary12] PRIMARY KEY CLUSTERED 
(
	[iddetalle_insumos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[diseñadores/publicistas]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[diseñadores/publicistas](
	[iddiseñadores] [int] NOT NULL,
	[empresa] [varchar](45) NULL,
	[direccion] [varchar](45) NULL,
	[telefono] [varchar](45) NULL,
 CONSTRAINT [primary13] PRIMARY KEY CLUSTERED 
(
	[iddiseñadores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[docentes]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[docentes](
	[iddocente] [int] NOT NULL,
	[nombre] [varchar](45) NULL,
	[apellidos] [varchar](45) NULL,
	[direccion] [varchar](45) NULL,
	[telefono] [varchar](8) NULL,
	[idcurso] [int] NULL,
 CONSTRAINT [primary] PRIMARY KEY CLUSTERED 
(
	[iddocente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estudiante]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estudiante](
	[idestudiante] [int] NOT NULL,
	[nombre_estudiante] [varchar](45) NULL,
	[apellido_estudiante] [varchar](45) NULL,
	[telefono] [varchar](8) NULL,
	[direccion] [varchar](45) NULL,
	[idnivel] [int] NULL,
	[idcursos] [int] NULL,
	[cursos_idcursos] [int] NOT NULL,
 CONSTRAINT [primary6] PRIMARY KEY CLUSTERED 
(
	[idestudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[existencia_libros]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[existencia_libros](
	[idlibros] [int] NOT NULL,
	[nombre_libro] [varchar](45) NULL,
	[cantidad] [int] NULL,
	[nivel] [varchar](45) NULL,
	[precio] [int] NULL,
 CONSTRAINT [primary10] PRIMARY KEY CLUSTERED 
(
	[idlibros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[factura_mensualidades]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[factura_mensualidades](
	[idcobros] [int] NOT NULL,
	[fecha_emision] [datetime2](7) NULL,
	[idestudiante] [int] NULL,
	[descuento] [int] NULL,
	[nit] [varchar](8) NULL,
	[total] [int] NULL,
	[idventas] [int] NULL,
	[idpromociones] [int] NULL,
 CONSTRAINT [primary7] PRIMARY KEY CLUSTERED 
(
	[idcobros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[facturación_insumos]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[facturación_insumos](
	[idventas] [int] NOT NULL,
	[nombre_libro] [varchar](45) NULL,
	[nivel] [varchar](45) NULL,
	[precio] [int] NULL,
	[idestudiante] [int] NULL,
	[fecha] [date] NULL,
	[idsede] [int] NULL,
	[cantidad] [int] NULL,
	[existencia_libros_idlibros] [int] NOT NULL,
 CONSTRAINT [primary11] PRIMARY KEY CLUSTERED 
(
	[idventas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[insumos_oficina]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[insumos_oficina](
	[idinsumos] [int] NOT NULL,
	[descripcion_insumo] [varchar](45) NULL,
	[cantidadexistente] [int] NULL,
	[precio] [int] NULL,
 CONSTRAINT [primary14] PRIMARY KEY CLUSTERED 
(
	[idinsumos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[interesados]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[interesados](
	[idinteresados] [int] NOT NULL,
	[nombre] [varchar](45) NULL,
	[apellidos] [varchar](45) NULL,
	[direccion] [varchar](45) NULL,
	[telefono] [varchar](8) NULL,
 CONSTRAINT [primary15] PRIMARY KEY CLUSTERED 
(
	[idinteresados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[libros]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[libros](
	[idlibros] [int] NOT NULL,
	[nombre] [varchar](45) NULL,
	[idnivel] [int] NULL,
	[precios_idprecio_servicios] [int] NOT NULL,
 CONSTRAINT [primary9] PRIMARY KEY CLUSTERED 
(
	[idlibros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[meses_del_año]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[meses_del_año](
	[idmeses] [int] NOT NULL,
	[mes] [varchar](10) NULL,
 CONSTRAINT [primary5] PRIMARY KEY CLUSTERED 
(
	[idmeses] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mobiliario]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mobiliario](
	[idmobiliario] [int] NOT NULL,
	[tipomobiliario] [varchar](45) NULL,
	[existencia] [int] NULL,
	[idproveedores] [int] NULL,
 CONSTRAINT [primary17] PRIMARY KEY CLUSTERED 
(
	[idmobiliario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[niveles]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[niveles](
	[idnivel] [int] NOT NULL,
	[nivel] [varchar](45) NULL,
 CONSTRAINT [primary2] PRIMARY KEY CLUSTERED 
(
	[idnivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pagos]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pagos](
	[idpagos] [int] NOT NULL,
	[descripcion] [varchar](45) NULL,
	[cantidad] [int] NULL,
	[total] [int] NULL,
	[iddiseñadores] [int] NULL,
	[idalquilersedes] [int] NULL,
	[iddocentes] [int] NULL,
	[idinsumos] [int] NULL,
	[idproveedores] [int] NULL,
 CONSTRAINT [primary19] PRIMARY KEY CLUSTERED 
(
	[idpagos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[precios]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precios](
	[idprecios] [int] NOT NULL,
	[precio] [int] NULL,
	[idcursos] [int] NULL,
 CONSTRAINT [primary1] PRIMARY KEY CLUSTERED 
(
	[idprecios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[programas]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[programas](
	[idprogramas] [int] NOT NULL,
	[nombre] [varchar](45) NULL,
	[descripcion] [varchar](45) NULL,
	[idsedes] [varchar](45) NULL,
	[iddocente] [int] NULL,
	[duracionprograma] [varchar](45) NULL,
	[costo] [int] NULL,
	[idcurso] [int] NOT NULL,
 CONSTRAINT [primary20] PRIMARY KEY CLUSTERED 
(
	[idprogramas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[programas_has_sedes]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programas_has_sedes](
	[programas_idprogramas] [int] NOT NULL,
	[sedes_idsedes] [int] NOT NULL,
 CONSTRAINT [primary21] PRIMARY KEY CLUSTERED 
(
	[programas_idprogramas] ASC,
	[sedes_idsedes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promociones]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[promociones](
	[idpromociones] [int] NOT NULL,
	[descripcionpromocion] [varchar](45) NULL,
	[descuento] [int] NULL,
	[idestudiante] [int] NULL,
 CONSTRAINT [primary4] PRIMARY KEY CLUSTERED 
(
	[idpromociones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[proveedores]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proveedores](
	[idproveedores] [int] NOT NULL,
	[nombreproveedor] [varchar](45) NULL,
	[telefono] [varchar](45) NULL,
	[direccion] [varchar](45) NULL,
 CONSTRAINT [primary16] PRIMARY KEY CLUSTERED 
(
	[idproveedores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sedes]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sedes](
	[idsedes] [int] NOT NULL,
	[municipio] [varchar](45) NULL,
	[direccion] [varchar](45) NULL,
	[idcursos] [int] NULL,
 CONSTRAINT [primary18] PRIMARY KEY CLUSTERED 
(
	[idsedes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sedes_has_cursos]    Script Date: 12-Jun-19 5:00:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sedes_has_cursos](
	[sedes_idsedes] [int] NOT NULL,
	[cursos_idcursos] [int] NOT NULL,
 CONSTRAINT [primary22] PRIMARY KEY CLUSTERED 
(
	[sedes_idsedes] ASC,
	[cursos_idcursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [fk_cursos_docentes1_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk_cursos_docentes1_idx] ON [dbo].[cursos]
(
	[docentes_iddocente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_cursos_precios1_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk_cursos_precios1_idx] ON [dbo].[cursos]
(
	[precios_idprecio_servicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idnivel_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idnivel_idx] ON [dbo].[cursos]
(
	[idnivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_detalle_factura_mensualidades1_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk_detalle_factura_mensualidades1_idx] ON [dbo].[detalle]
(
	[idcobros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idcursos_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idcursos_idx] ON [dbo].[detalle]
(
	[idcursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idmeses_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idmeses_idx] ON [dbo].[detalle]
(
	[idmeses] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idprecio_servicios_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idprecio_servicios_idx] ON [dbo].[detalle]
(
	[idprecio_servicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idcursos_idx1]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idcursos_idx1] ON [dbo].[detalle_insumos]
(
	[idcursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idlibros_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idlibros_idx] ON [dbo].[detalle_insumos]
(
	[idlibros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idprecio_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idprecio_idx] ON [dbo].[detalle_insumos]
(
	[idprecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idventas_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idventas_idx] ON [dbo].[detalle_insumos]
(
	[idventas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_estudiante_cursos1_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk_estudiante_cursos1_idx] ON [dbo].[estudiante]
(
	[cursos_idcursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk idpromociones_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk idpromociones_idx] ON [dbo].[factura_mensualidades]
(
	[idpromociones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idestudiante_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idestudiante_idx] ON [dbo].[factura_mensualidades]
(
	[idestudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk idestudiante_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk idestudiante_idx] ON [dbo].[facturación_insumos]
(
	[idestudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_ventas_libros_existencia_libros1_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk_ventas_libros_existencia_libros1_idx] ON [dbo].[facturación_insumos]
(
	[existencia_libros_idlibros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_libros_precios1_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk_libros_precios1_idx] ON [dbo].[libros]
(
	[precios_idprecio_servicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idnivel_idx1]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idnivel_idx1] ON [dbo].[libros]
(
	[idnivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk proveedores_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk proveedores_idx] ON [dbo].[mobiliario]
(
	[idproveedores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk diseñadores_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk diseñadores_idx] ON [dbo].[pagos]
(
	[iddiseñadores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk docentes_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk docentes_idx] ON [dbo].[pagos]
(
	[iddocentes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk insumos_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk insumos_idx] ON [dbo].[pagos]
(
	[idinsumos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk sedes_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk sedes_idx] ON [dbo].[pagos]
(
	[idalquilersedes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idproveedores_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [idproveedores_idx] ON [dbo].[pagos]
(
	[idproveedores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk idcurso_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk idcurso_idx] ON [dbo].[programas]
(
	[idcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk iddocente_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk iddocente_idx] ON [dbo].[programas]
(
	[iddocente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_programas_has_sedes_programas1_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk_programas_has_sedes_programas1_idx] ON [dbo].[programas_has_sedes]
(
	[programas_idprogramas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_programas_has_sedes_sedes1_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk_programas_has_sedes_sedes1_idx] ON [dbo].[programas_has_sedes]
(
	[sedes_idsedes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_sedes_has_cursos_cursos1_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk_sedes_has_cursos_cursos1_idx] ON [dbo].[sedes_has_cursos]
(
	[cursos_idcursos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_sedes_has_cursos_sedes1_idx]    Script Date: 12-Jun-19 5:00:46 PM ******/
CREATE NONCLUSTERED INDEX [fk_sedes_has_cursos_sedes1_idx] ON [dbo].[sedes_has_cursos]
(
	[sedes_idsedes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cursos]  WITH CHECK ADD  CONSTRAINT [fk_cursos_docentes1] FOREIGN KEY([docentes_iddocente])
REFERENCES [dbo].[docentes] ([iddocente])
GO
ALTER TABLE [dbo].[cursos] CHECK CONSTRAINT [fk_cursos_docentes1]
GO
ALTER TABLE [dbo].[cursos]  WITH CHECK ADD  CONSTRAINT [fk_cursos_precios1] FOREIGN KEY([precios_idprecio_servicios])
REFERENCES [dbo].[precios] ([idprecios])
GO
ALTER TABLE [dbo].[cursos] CHECK CONSTRAINT [fk_cursos_precios1]
GO
ALTER TABLE [dbo].[cursos]  WITH CHECK ADD  CONSTRAINT [idnivel] FOREIGN KEY([idnivel])
REFERENCES [dbo].[niveles] ([idnivel])
GO
ALTER TABLE [dbo].[cursos] CHECK CONSTRAINT [idnivel]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [fk_detalle_factura_mensualidades1] FOREIGN KEY([idcobros])
REFERENCES [dbo].[factura_mensualidades] ([idcobros])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [fk_detalle_factura_mensualidades1]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [idcursos] FOREIGN KEY([idcursos])
REFERENCES [dbo].[cursos] ([idcursos])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [idcursos]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [idmeses] FOREIGN KEY([idmeses])
REFERENCES [dbo].[meses_del_año] ([idmeses])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [idmeses]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [idprecio_servicios] FOREIGN KEY([idprecio_servicios])
REFERENCES [dbo].[precios] ([idprecios])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [idprecio_servicios]
GO
ALTER TABLE [dbo].[detalle_insumos]  WITH CHECK ADD  CONSTRAINT [idcursoss] FOREIGN KEY([idcursos])
REFERENCES [dbo].[cursos] ([idcursos])
GO
ALTER TABLE [dbo].[detalle_insumos] CHECK CONSTRAINT [idcursoss]
GO
ALTER TABLE [dbo].[detalle_insumos]  WITH CHECK ADD  CONSTRAINT [idlibross] FOREIGN KEY([idlibros])
REFERENCES [dbo].[libros] ([idlibros])
GO
ALTER TABLE [dbo].[detalle_insumos] CHECK CONSTRAINT [idlibross]
GO
ALTER TABLE [dbo].[detalle_insumos]  WITH CHECK ADD  CONSTRAINT [idprecioss] FOREIGN KEY([idprecio])
REFERENCES [dbo].[precios] ([idprecios])
GO
ALTER TABLE [dbo].[detalle_insumos] CHECK CONSTRAINT [idprecioss]
GO
ALTER TABLE [dbo].[detalle_insumos]  WITH CHECK ADD  CONSTRAINT [idventass] FOREIGN KEY([idventas])
REFERENCES [dbo].[facturación_insumos] ([idventas])
GO
ALTER TABLE [dbo].[detalle_insumos] CHECK CONSTRAINT [idventass]
GO
ALTER TABLE [dbo].[estudiante]  WITH CHECK ADD  CONSTRAINT [fk_estudiante_cursos1] FOREIGN KEY([cursos_idcursos])
REFERENCES [dbo].[cursos] ([idcursos])
GO
ALTER TABLE [dbo].[estudiante] CHECK CONSTRAINT [fk_estudiante_cursos1]
GO
ALTER TABLE [dbo].[estudiante]  WITH CHECK ADD  CONSTRAINT [FK_estudiante_niveles] FOREIGN KEY([idnivel])
REFERENCES [dbo].[niveles] ([idnivel])
GO
ALTER TABLE [dbo].[estudiante] CHECK CONSTRAINT [FK_estudiante_niveles]
GO
ALTER TABLE [dbo].[factura_mensualidades]  WITH CHECK ADD  CONSTRAINT [fk idpromociones] FOREIGN KEY([idpromociones])
REFERENCES [dbo].[promociones] ([idpromociones])
GO
ALTER TABLE [dbo].[factura_mensualidades] CHECK CONSTRAINT [fk idpromociones]
GO
ALTER TABLE [dbo].[factura_mensualidades]  WITH CHECK ADD  CONSTRAINT [idestudiante] FOREIGN KEY([idestudiante])
REFERENCES [dbo].[estudiante] ([idestudiante])
GO
ALTER TABLE [dbo].[factura_mensualidades] CHECK CONSTRAINT [idestudiante]
GO
ALTER TABLE [dbo].[facturación_insumos]  WITH CHECK ADD  CONSTRAINT [fk idestudiante] FOREIGN KEY([idestudiante])
REFERENCES [dbo].[estudiante] ([idestudiante])
GO
ALTER TABLE [dbo].[facturación_insumos] CHECK CONSTRAINT [fk idestudiante]
GO
ALTER TABLE [dbo].[facturación_insumos]  WITH CHECK ADD  CONSTRAINT [fk_ventas_libros_existencia_libros1] FOREIGN KEY([existencia_libros_idlibros])
REFERENCES [dbo].[existencia_libros] ([idlibros])
GO
ALTER TABLE [dbo].[facturación_insumos] CHECK CONSTRAINT [fk_ventas_libros_existencia_libros1]
GO
ALTER TABLE [dbo].[libros]  WITH CHECK ADD  CONSTRAINT [fk_libros_precios1] FOREIGN KEY([precios_idprecio_servicios])
REFERENCES [dbo].[precios] ([idprecios])
GO
ALTER TABLE [dbo].[libros] CHECK CONSTRAINT [fk_libros_precios1]
GO
ALTER TABLE [dbo].[libros]  WITH CHECK ADD  CONSTRAINT [idnivell] FOREIGN KEY([idnivel])
REFERENCES [dbo].[niveles] ([idnivel])
GO
ALTER TABLE [dbo].[libros] CHECK CONSTRAINT [idnivell]
GO
ALTER TABLE [dbo].[mobiliario]  WITH CHECK ADD  CONSTRAINT [fk proveedores] FOREIGN KEY([idproveedores])
REFERENCES [dbo].[proveedores] ([idproveedores])
GO
ALTER TABLE [dbo].[mobiliario] CHECK CONSTRAINT [fk proveedores]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [fk diseñadores] FOREIGN KEY([iddiseñadores])
REFERENCES [dbo].[diseñadores/publicistas] ([iddiseñadores])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [fk diseñadores]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [fk docentes] FOREIGN KEY([iddocentes])
REFERENCES [dbo].[docentes] ([iddocente])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [fk docentes]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [fk insumos] FOREIGN KEY([idinsumos])
REFERENCES [dbo].[insumos_oficina] ([idinsumos])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [fk insumos]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [fk sedes] FOREIGN KEY([idalquilersedes])
REFERENCES [dbo].[sedes] ([idsedes])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [fk sedes]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [idproveedores] FOREIGN KEY([idproveedores])
REFERENCES [dbo].[proveedores] ([idproveedores])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [idproveedores]
GO
ALTER TABLE [dbo].[programas]  WITH CHECK ADD  CONSTRAINT [fk idcurso] FOREIGN KEY([idcurso])
REFERENCES [dbo].[cursos] ([idcursos])
GO
ALTER TABLE [dbo].[programas] CHECK CONSTRAINT [fk idcurso]
GO
ALTER TABLE [dbo].[programas]  WITH CHECK ADD  CONSTRAINT [fk iddocente] FOREIGN KEY([iddocente])
REFERENCES [dbo].[docentes] ([iddocente])
GO
ALTER TABLE [dbo].[programas] CHECK CONSTRAINT [fk iddocente]
GO
ALTER TABLE [dbo].[programas_has_sedes]  WITH CHECK ADD  CONSTRAINT [fk_programas_has_sedes_programas1] FOREIGN KEY([programas_idprogramas])
REFERENCES [dbo].[programas] ([idprogramas])
GO
ALTER TABLE [dbo].[programas_has_sedes] CHECK CONSTRAINT [fk_programas_has_sedes_programas1]
GO
ALTER TABLE [dbo].[programas_has_sedes]  WITH CHECK ADD  CONSTRAINT [fk_programas_has_sedes_sedes1] FOREIGN KEY([sedes_idsedes])
REFERENCES [dbo].[sedes] ([idsedes])
GO
ALTER TABLE [dbo].[programas_has_sedes] CHECK CONSTRAINT [fk_programas_has_sedes_sedes1]
GO
ALTER TABLE [dbo].[sedes_has_cursos]  WITH CHECK ADD  CONSTRAINT [fk_sedes_has_cursos_cursos1] FOREIGN KEY([cursos_idcursos])
REFERENCES [dbo].[cursos] ([idcursos])
GO
ALTER TABLE [dbo].[sedes_has_cursos] CHECK CONSTRAINT [fk_sedes_has_cursos_cursos1]
GO
ALTER TABLE [dbo].[sedes_has_cursos]  WITH CHECK ADD  CONSTRAINT [fk_sedes_has_cursos_sedes1] FOREIGN KEY([sedes_idsedes])
REFERENCES [dbo].[sedes] ([idsedes])
GO
ALTER TABLE [dbo].[sedes_has_cursos] CHECK CONSTRAINT [fk_sedes_has_cursos_sedes1]
GO
USE [master]
GO
ALTER DATABASE [udeodb] SET  READ_WRITE 
GO
