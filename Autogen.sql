USE [master]
GO
/****** Object:  Database [AlbumDelleBand]    Script Date: 22/10/2021 14:32:37 ******/
CREATE DATABASE [AlbumDelleBand]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlbumDelleBand', FILENAME = N'C:\Users\valem\AlbumDelleBand.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlbumDelleBand_log', FILENAME = N'C:\Users\valem\AlbumDelleBand_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AlbumDelleBand] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlbumDelleBand].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlbumDelleBand] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AlbumDelleBand] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlbumDelleBand] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlbumDelleBand] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AlbumDelleBand] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlbumDelleBand] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AlbumDelleBand] SET  MULTI_USER 
GO
ALTER DATABASE [AlbumDelleBand] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlbumDelleBand] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlbumDelleBand] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlbumDelleBand] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlbumDelleBand] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AlbumDelleBand] SET QUERY_STORE = OFF
GO
USE [AlbumDelleBand]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [AlbumDelleBand]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 22/10/2021 14:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[IDAlbum] [int] IDENTITY(1,1) NOT NULL,
	[TitoloAlb] [nvarchar](30) NOT NULL,
	[AnnoUscita] [int] NOT NULL,
	[CasaDiscografica] [nvarchar](30) NOT NULL,
	[Genere] [nvarchar](20) NOT NULL,
	[Supporto] [nvarchar](20) NOT NULL,
	[IDBand] [int] NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[IDAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumBrano]    Script Date: 22/10/2021 14:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumBrano](
	[IDAlbum] [int] NOT NULL,
	[IDBrano] [int] NOT NULL,
 CONSTRAINT [PK_AlbumBrano] PRIMARY KEY CLUSTERED 
(
	[IDAlbum] ASC,
	[IDBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 22/10/2021 14:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[IDBand] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](30) NOT NULL,
	[NumeroComponenti] [int] NOT NULL,
 CONSTRAINT [PK_Band] PRIMARY KEY CLUSTERED 
(
	[IDBand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 22/10/2021 14:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[IDBrano] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](30) NOT NULL,
	[Durata] [int] NOT NULL,
 CONSTRAINT [PK_Brano] PRIMARY KEY CLUSTERED 
(
	[IDBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (1, N'Hanno ucciso Uomo Ragno', 1992, N'FriRecords', N'pop', N'CD', 1)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (2, N'La donna il sogno', 1995, N'FriRecords', N'pop', N'CD', 1)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (3, N'Hanno ucciso Uomo Ragno', 1992, N'FriRecords', N'pop', N'musicassetta', 1)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (4, N'La dura legge del gol', 1997, N'FriRecords', N'pop', N'Vinile', 1)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (5, N'Grazie mille', 1999, N'S4', N'pop', N'CD', 1)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (6, N'Il ballo della vita', 2018, N'Sony', N'rock', N'CD', 3)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (7, N'Teatro d''ira', 2021, N'Sony', N'rock', N'Straming', 3)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (8, N'giornalisti', 2016, N'Sony', N'pop', N'Straming', 4)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (9, N'Imagine', 1971, N'Sony', N'rock', N'Vinile', 5)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (10, N'Immagina', 1990, N'Sony', N'rock', N'CD', 5)
INSERT [dbo].[Album] ([IDAlbum], [TitoloAlb], [AnnoUscita], [CasaDiscografica], [Genere], [Supporto], [IDBand]) VALUES (11, N'Imagine modern version', 2020, N'Sony', N'rock', N'Straming', 5)
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (1, 1)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (2, 2)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (3, 3)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (4, 4)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (6, 5)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (6, 6)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (6, 7)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (6, 8)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (8, 9)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (8, 10)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (8, 11)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (8, 12)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (8, 13)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (9, 19)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (10, 19)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (11, 19)
GO
SET IDENTITY_INSERT [dbo].[Band] ON 

INSERT [dbo].[Band] ([IDBand], [Nome], [NumeroComponenti]) VALUES (1, N'883', 5)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumeroComponenti]) VALUES (2, N'Queen', 5)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumeroComponenti]) VALUES (3, N'Maneskin', 4)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumeroComponenti]) VALUES (4, N'The giornalisti', 4)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumeroComponenti]) VALUES (5, N'Beatles', 6)
SET IDENTITY_INSERT [dbo].[Band] OFF
GO
SET IDENTITY_INSERT [dbo].[Brano] ON 

INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (1, N'Dura Legge Del Gol', 200)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (2, N'Lunga Estate Caldissima', 220)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (3, N'Regina Del Celebrita', 300)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (4, N'Regola Dell''Amico', 180)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (5, N'New Song', 203)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (6, N'Torna a casa', 280)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (7, N'Immortale', 150)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (8, N'Moriro da re', 157)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (9, N'Siamo tutti marziani', 300)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (10, N'Mare Balotelli', 180)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (11, N'Fine dell''estate', 120)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (12, N' Tra la strada e le stelle', 112)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (13, N'Il tuo maglione mio', 190)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (14, N'Siamo tutti marziani', 300)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (15, N'Mare Balotelli', 180)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (16, N'Fine dell''estate', 120)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (17, N' Tra la strada e le stelle', 112)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (18, N'Il tuo maglione mio', 190)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (19, N'Imagine', 180)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (20, N'I want to break free', 180)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (21, N'Bicycle', 180)
SET IDENTITY_INSERT [dbo].[Brano] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Album__71DF7F494AF2C6DC]    Script Date: 22/10/2021 14:32:38 ******/
ALTER TABLE [dbo].[Album] ADD UNIQUE NONCLUSTERED 
(
	[TitoloAlb] ASC,
	[AnnoUscita] ASC,
	[CasaDiscografica] ASC,
	[Genere] ASC,
	[Supporto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Band] FOREIGN KEY([IDBand])
REFERENCES [dbo].[Band] ([IDBand])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Band]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_Album] FOREIGN KEY([IDAlbum])
REFERENCES [dbo].[Album] ([IDAlbum])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_Album]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_Brano] FOREIGN KEY([IDBrano])
REFERENCES [dbo].[Brano] ([IDBrano])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_Brano]
GO
ALTER TABLE [dbo].[Band]  WITH CHECK ADD CHECK  (([NumeroComponenti]>(0)))
GO
USE [master]
GO
ALTER DATABASE [AlbumDelleBand] SET  READ_WRITE 
GO
