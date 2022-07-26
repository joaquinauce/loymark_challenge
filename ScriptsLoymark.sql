﻿USE [master]
GO
CREATE DATABASE [LoyMarkChallenge] ON  PRIMARY 
ALTER DATABASE [LoyMarkChallenge] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LoyMarkChallenge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LoyMarkChallenge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET ARITHABORT OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LoyMarkChallenge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LoyMarkChallenge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LoyMarkChallenge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LoyMarkChallenge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LoyMarkChallenge] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LoyMarkChallenge] SET  MULTI_USER 
GO
ALTER DATABASE [LoyMarkChallenge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LoyMarkChallenge] SET DB_CHAINING OFF 
GO
USE [LoyMarkChallenge]
GO
/****** Object:  Table [dbo].[actividades]    Script Date: 7/22/2022 10:32:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actividades](
	[id_actividad] [int] IDENTITY(1,1) NOT NULL,
	[create_date] [date] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[actividad] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_actividades] PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 7/22/2022 10:32:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[id_pais] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[codigo_internacional] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 7/22/2022 10:32:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[apellido] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[fecha_nacimiento] [datetime2](7) NOT NULL,
	[telefono] [nvarchar](20) NULL,
	[id_pais] [int] NOT NULL,
	[pais_codigo] [nvarchar](50) NOT NULL,
	[recibe_informacion] [bit] NOT NULL,
	[fecha_baja] [datetime2](7) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[paises] ON 

INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (1, N'Afganistán', N'AFG')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (2, N'Albania', N'ALB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (3, N'Alemania', N'DEU')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (4, N'Andorra', N'AND')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (5, N'Angola', N'AGO')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (6, N'Anguila', N'AIA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (7, N'Antártida', N'ATA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (8, N'Antigua y Barbuda', N'ATG')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (9, N'Arabia Saudita', N'SAU')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (10, N'Argelia', N'DZA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (11, N'Argentina', N'ARG')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (12, N'Armenia', N'ARM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (13, N'Aruba', N'ABW')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (14, N'Australia', N'AUS')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (15, N'Austria', N'AUT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (16, N'Azerbaiyán', N'AZE')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (17, N'Bahamas', N'BHS')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (18, N'Bahrein', N'BHR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (19, N'Bailía de Guernsey', N'GGY')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (20, N'Bangladesh', N'BGD')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (21, N'Barbados', N'BRB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (22, N'Belarús', N'BLR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (23, N'Bélgica', N'BEL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (24, N'Belice', N'BLZ')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (25, N'Benín', N'BEN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (26, N'Bermudas', N'BMU')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (27, N'Bolivia', N'BOL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (28, N'Bonaire, San Eustaquio y Saba', N'BES')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (29, N'Bosnia y Hercegovina', N'BIH')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (30, N'Botsuana', N'BWA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (31, N'Brasil', N'BRA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (32, N'Brunéi', N'BRN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (33, N'Bulgaria', N'BGR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (34, N'Burkina Faso', N'BFA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (35, N'Burundi', N'BDI')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (36, N'Bután', N'BTN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (37, N'Cabo Verde', N'CPV')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (38, N'Cambodia', N'KHM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (39, N'Camerún', N'CMR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (40, N'Canadá', N'CAN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (41, N'Catar', N'QAT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (42, N'Chad', N'TCD')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (43, N'Chequia', N'CZE')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (44, N'Chile', N'CHL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (45, N'China', N'CHN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (46, N'Chipre', N'CYP')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (47, N'Ciudad del Vaticano', N'VAT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (48, N'Colombia', N'COL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (49, N'Comores', N'COM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (50, N'Congo', N'COG')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (51, N'Corea del Norte', N'PRK')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (52, N'Corea del Sur', N'KOR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (53, N'Costa de Marfil', N'CIV')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (54, N'Costa Rica', N'CRI')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (55, N'Croacia', N'HRV')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (56, N'Cuba', N'CUB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (57, N'Curaçao', N'CUW')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (58, N'Dinamarca', N'DNK')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (59, N'Dominica', N'DMA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (60, N'Ecuador', N'ECU')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (61, N'Egipto', N'EGY')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (62, N'El Salvador', N'SLV')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (63, N'Emiratos Árabes Unidos', N'ARE')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (64, N'Eritrea', N'ERI')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (65, N'Eslovaquia', N'SVK')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (66, N'Eslovenia', N'SVN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (67, N'España', N'ESP')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (68, N'Estados Federados de Micronesia', N'FSM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (69, N'Estados Unidos', N'USA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (70, N'Estonia', N'EST')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (71, N'Esuatini', N'SWZ')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (72, N'Etiopía', N'ETH')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (73, N'Fiji', N'FJI')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (74, N'Filipinas', N'PHL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (75, N'Finlandia', N'FIN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (76, N'Francia', N'FRA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (77, N'Gabón', N'GAB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (78, N'Gambia', N'GMB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (79, N'Georgia', N'GEO')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (80, N'Georgia del Sur y las Islas Sandwich del Sur', N'SGS')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (81, N'Ghana', N'GHA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (82, N'Gibraltar', N'GIB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (83, N'Granada', N'GRD')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (84, N'Grecia', N'GRC')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (85, N'Groenlandia', N'GRL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (86, N'Guadalupe', N'GLP')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (87, N'Guam', N'GUM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (88, N'Guatemala', N'GTM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (89, N'Guayana', N'GUY')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (90, N'Guayana Francesa', N'GUF')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (91, N'Guinea', N'GIN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (92, N'Guinea Ecuatorial', N'GNQ')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (93, N'Guinea-Bissau', N'GNB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (94, N'Haití', N'HTI')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (95, N'Honduras', N'HND')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (96, N'Hong Kong', N'HKG')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (97, N'Hungría', N'HUN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (98, N'India', N'IND')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (99, N'Indonesia', N'IDN')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (100, N'Irán', N'IRN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (101, N'Iraq', N'IRQ')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (102, N'Irlanda', N'IRL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (103, N'Isla Bouvet', N'BVT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (104, N'Isla de Man', N'IMN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (105, N'Isla de Navidad', N'CXR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (106, N'Isla de San Martín', N'MAF')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (107, N'Isla Mauricio', N'MUS')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (108, N'Isla Norfolk', N'NFK')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (109, N'Islandia', N'ISL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (110, N'Islas Åland', N'ALA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (111, N'Islas Caimán', N'CYM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (112, N'Islas Cocos', N'CCK')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (113, N'Islas Cook', N'COK')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (114, N'Islas Feroe', N'FRO')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (115, N'Islas Heard y McDonald', N'HMD')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (116, N'Islas Malvinas', N'FLK')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (117, N'Islas Marianas del Norte', N'MNP')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (118, N'Islas Marshall', N'MHL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (119, N'Islas Pitcairn', N'PCN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (120, N'Islas Salomón', N'SLB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (121, N'Islas Turcas y Caicos', N'TCA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (122, N'Islas Vírgenes (UK', N'VGB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (123, N'Islas Vírgenes Americanas', N'VIR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (124, N'Israel', N'ISR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (125, N'Italia', N'ITA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (126, N'Jamaica', N'JAM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (127, N'Japón', N'JPN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (128, N'Jersey', N'JEY')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (129, N'Jordania', N'JOR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (130, N'Kazajstán', N'KAZ')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (131, N'Kenia', N'KEN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (132, N'Kirguistán', N'KGZ')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (133, N'Kiribati', N'KIR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (134, N'Kosovo', N'XKX')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (135, N'Kuwait', N'KWT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (136, N'Laos', N'LAO')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (137, N'Lesotho', N'LSO')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (138, N'Letonia', N'LVA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (139, N'Líbano', N'LBN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (140, N'Liberia', N'LBR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (141, N'Libia', N'LBY')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (142, N'Liechtenstein', N'LIE')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (143, N'Lituania', N'LTU')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (144, N'Luxemburgo', N'LUX')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (145, N'Macao', N'MAC')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (146, N'Macedonia del Norte', N'MKD')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (147, N'Madagascar', N'MDG')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (148, N'Malasia', N'MYS')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (149, N'Malaui', N'MWI')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (150, N'Maldivas', N'MDV')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (151, N'Malí', N'MLI')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (152, N'Malta', N'MLT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (153, N'Marruecos', N'MAR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (154, N'Martinica', N'MTQ')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (155, N'Mauritania', N'MRT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (156, N'Mayotte', N'MYT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (157, N'México', N'MEX')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (158, N'Moldavia', N'MDA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (159, N'Mongolia', N'MNG')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (160, N'Montenegro', N'MNE')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (161, N'Montserrat', N'MSR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (162, N'Mozambique', N'MOZ')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (163, N'Myanmar', N'MMR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (164, N'Namibia', N'NAM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (165, N'Nauru', N'NRU')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (166, N'Nepal', N'NPL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (167, N'Nicaragua', N'NIC')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (168, N'Níger', N'NER')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (169, N'Nigeria', N'NGA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (170, N'Niue', N'NIU')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (171, N'Noruega', N'NOR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (172, N'Nueva Caledonia', N'NCL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (173, N'Nueva Zelandia', N'NZL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (174, N'Omán', N'OMN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (175, N'Países Bajos', N'NLD')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (176, N'Pakistán', N'PAK')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (177, N'Palaos', N'PLW')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (178, N'Palestina', N'PSE')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (179, N'Panamá', N'PAN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (180, N'Papúa Nueva Guinea', N'PNG')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (181, N'Paraguay', N'PRY')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (182, N'Perú', N'PER')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (183, N'Polinesia Francesa', N'PYF')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (184, N'Polonia', N'POL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (185, N'Portugal', N'PRT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (186, N'Principado de Mónaco', N'MCO')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (187, N'Puerto Rico', N'PRI')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (188, N'Reino Unido', N'GBR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (189, N'República Centroafricana', N'CAF')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (190, N'República Democrática del Congo', N'COD')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (191, N'República Dominicana', N'DOM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (192, N'Reunión', N'REU')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (193, N'Ruanda', N'RWA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (194, N'Rumania', N'ROU')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (195, N'Rusia', N'RUS')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (196, N'Sáhara Occidental', N'ESH')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (197, N'Samoa', N'WSM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (198, N'Samoa Americana', N'ASM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (199, N'San Bartolomé', N'BLM')
GO
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (200, N'San Cristóbal y Nieves', N'KNA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (201, N'San Marino', N'SMR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (202, N'San Pedro y Miquelón', N'SPM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (203, N'San Vicente y las Granadinas', N'VCT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (204, N'Santa Elena, Ascensión y Tristán de Acuña', N'SHN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (205, N'Santa Lucía', N'LCA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (206, N'Santo Tomé y Príncipe', N'STP')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (207, N'Senegal', N'SEN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (208, N'Serbia', N'SRB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (209, N'Seychelles', N'SYC')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (210, N'Sierra Leona', N'SLE')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (211, N'Singapur', N'SGP')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (212, N'Sint Maarten', N'SXM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (213, N'Siria', N'SYR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (214, N'Somalia', N'SOM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (215, N'Sri Lanka', N'LKA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (216, N'Sudáfrica', N'ZAF')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (217, N'Sudán', N'SDN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (218, N'Sudán del Sur', N'SSD')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (219, N'Suecia', N'SWE')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (220, N'Suiza', N'CHE')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (221, N'Surinam', N'SUR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (222, N'Svalbard y Jan Mayen', N'SJM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (223, N'Tailandia', N'THA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (224, N'Taiwán', N'TWN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (225, N'Tanzania', N'TZA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (226, N'Tayikistán', N'TJK')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (227, N'Territorio Británico del Océano Índico', N'IOT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (228, N'Territorios Australes y Antárticos Franceses', N'ATF')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (229, N'Timor Oriental', N'TLS')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (230, N'Togo', N'TGO')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (231, N'Tokelau', N'TKL')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (232, N'Tonga', N'TON')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (233, N'Trinidad y Tobago', N'TTO')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (234, N'Túnez', N'TUN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (235, N'Turkmenistán', N'TKM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (236, N'Turquía', N'TUR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (237, N'Tuvalu', N'TUV')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (238, N'Ucrania', N'UKR')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (239, N'Uganda', N'UGA')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (240, N'Uruguay', N'URY')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (241, N'Uzbekistán', N'UZB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (242, N'Vanuatu', N'VUT')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (243, N'Venezuela', N'VEN')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (244, N'Vietnam', N'VNM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (245, N'Wallis y Futuna', N'WLF')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (246, N'Yemen', N'YEM')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (247, N'Yibuti', N'DJI')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (248, N'Zambia', N'ZMB')
INSERT [dbo].[paises] ([id_pais], [nombre], [codigo_internacional]) VALUES (249, N'Zimbabue', N'ZWE')
SET IDENTITY_INSERT [dbo].[paises] OFF
GO
ALTER TABLE [dbo].[actividades]  WITH CHECK ADD  CONSTRAINT [FK_actividades_Usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[actividades] CHECK CONSTRAINT [FK_actividades_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_paises] FOREIGN KEY([id_pais])
REFERENCES [dbo].[paises] ([id_pais])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_paises]
GO
USE [master]
GO
ALTER DATABASE [LoyMarkChallenge] SET  READ_WRITE 
GO
