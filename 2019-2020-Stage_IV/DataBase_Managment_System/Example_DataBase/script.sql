USE [master]
GO
/****** Object:  Database [ChessTournament]    Script Date: 26/04/2020 06:19:52 ******/
CREATE DATABASE [ChessTournament]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChessTournament', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ChessTournament.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChessTournament_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ChessTournament_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ChessTournament] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChessTournament].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChessTournament] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChessTournament] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChessTournament] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChessTournament] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChessTournament] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChessTournament] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChessTournament] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChessTournament] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChessTournament] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChessTournament] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChessTournament] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChessTournament] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChessTournament] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChessTournament] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChessTournament] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChessTournament] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChessTournament] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChessTournament] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChessTournament] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChessTournament] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChessTournament] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChessTournament] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChessTournament] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ChessTournament] SET  MULTI_USER 
GO
ALTER DATABASE [ChessTournament] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChessTournament] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChessTournament] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChessTournament] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChessTournament] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChessTournament] SET QUERY_STORE = OFF
GO
USE [ChessTournament]
GO
/****** Object:  Table [dbo].[ChessGames]    Script Date: 26/04/2020 06:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChessGames](
	[ChessGameID] [char](10) NOT NULL,
	[TournamentID] [char](10) NOT NULL,
	[RefereeID] [char](10) NOT NULL,
	[RoundID] [char](10) NOT NULL,
	[TeamID1] [char](10) NOT NULL,
	[TeamID2] [char](10) NOT NULL,
 CONSTRAINT [PK_ChessGames] PRIMARY KEY CLUSTERED 
(
	[ChessGameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChessPlayers]    Script Date: 26/04/2020 06:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChessPlayers](
	[ChessPlayersID] [char](10) NOT NULL,
	[ChessTeamID] [char](10) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Surname] [nvarchar](20) NOT NULL,
	[Position] [nvarchar](10) NULL,
	[TableNo] [tinyint] NOT NULL,
	[ELO] [smallint] NOT NULL,
 CONSTRAINT [PK_ChessPlayers] PRIMARY KEY CLUSTERED 
(
	[ChessPlayersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChessTeams]    Script Date: 26/04/2020 06:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChessTeams](
	[ChessTeamID] [char](10) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Country] [nvarchar](20) NOT NULL,
	[Slogan] [nvarchar](20) NULL,
 CONSTRAINT [PK_ChessTeams] PRIMARY KEY CLUSTERED 
(
	[ChessTeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referees]    Script Date: 26/04/2020 06:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referees](
	[RefereeID] [char](10) NOT NULL,
	[Name] [char](20) NOT NULL,
	[Surname] [char](20) NOT NULL,
	[Rank] [nvarchar](10) NULL,
 CONSTRAINT [PK_Referees] PRIMARY KEY CLUSTERED 
(
	[RefereeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rounds]    Script Date: 26/04/2020 06:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rounds](
	[RoundID] [char](10) NOT NULL,
	[Time] [smalldatetime] NOT NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rounds] PRIMARY KEY CLUSTERED 
(
	[RoundID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 26/04/2020 06:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[TournamentID] [char](10) NOT NULL,
	[TournamentName] [nvarchar](20) NOT NULL,
	[TournamentCountry] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Tournaments] PRIMARY KEY CLUSTERED 
(
	[TournamentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChessGames] ([ChessGameID], [TournamentID], [RefereeID], [RoundID], [TeamID1], [TeamID2]) VALUES (N'0000000001', N'0000000001', N'0000000001', N'0000000001', N'0000000001', N'0000000002')
INSERT [dbo].[ChessGames] ([ChessGameID], [TournamentID], [RefereeID], [RoundID], [TeamID1], [TeamID2]) VALUES (N'0000000002', N'0000000001', N'0000000002', N'0000000001', N'0000000003', N'0000000004')
INSERT [dbo].[ChessGames] ([ChessGameID], [TournamentID], [RefereeID], [RoundID], [TeamID1], [TeamID2]) VALUES (N'0000000003', N'0000000001', N'0000000003', N'0000000002', N'0000000002', N'0000000003')
INSERT [dbo].[ChessGames] ([ChessGameID], [TournamentID], [RefereeID], [RoundID], [TeamID1], [TeamID2]) VALUES (N'0000000004', N'0000000001', N'0000000004', N'0000000002', N'0000000001', N'0000000004')
INSERT [dbo].[ChessGames] ([ChessGameID], [TournamentID], [RefereeID], [RoundID], [TeamID1], [TeamID2]) VALUES (N'0000000005', N'0000000001', N'0000000005', N'0000000003', N'0000000001', N'0000000003')
INSERT [dbo].[ChessGames] ([ChessGameID], [TournamentID], [RefereeID], [RoundID], [TeamID1], [TeamID2]) VALUES (N'0000000006', N'0000000001', N'0000000001', N'0000000003', N'0000000002', N'0000000004')
INSERT [dbo].[ChessGames] ([ChessGameID], [TournamentID], [RefereeID], [RoundID], [TeamID1], [TeamID2]) VALUES (N'0000000007', N'0000000002', N'0000000001', N'0000000004', N'0000000005', N'0000000006')
INSERT [dbo].[ChessGames] ([ChessGameID], [TournamentID], [RefereeID], [RoundID], [TeamID1], [TeamID2]) VALUES (N'0000000009', N'0000000002', N'0000000004', N'0000000005', N'0000000006', N'0000000007')
INSERT [dbo].[ChessGames] ([ChessGameID], [TournamentID], [RefereeID], [RoundID], [TeamID1], [TeamID2]) VALUES (N'0000000012', N'0000000002', N'0000000001', N'0000000006', N'0000000005', N'0000000007')
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000001', N'0000000004', N'Hasan Suca', N'Kayman', N'Captain', 1, 2500)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000002', N'0000000004', N'Osman', N'Altintas', N'Cr Captain', 2, 2499)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000003', N'0000000004', N'Bahtiyar', N'Celikhan', N'Member', 3, 2541)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000004', N'0000000004', N'Ahmet', N'Tanriverdi', N'Member', 4, 2333)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000005', N'0000000001', N'Fabiano', N'Caruana', N'Captain', 1, 2222)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000006', N'0000000001', N'Vladimir', N'Kramnik', N'Cr Captain', 2, 2121)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000007', N'0000000001', N'Robert', N'James', N'Member', 3, 2432)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000008', N'0000000001', N'Aleksandr', N'Alekhine', N'Member', 4, 2987)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000009', N'0000000002', N'Mikhail', N'Tail', N'Captain', 1, 1234)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000010', N'0000000002', N'Bent', N'Larsen', N'Cr Captain', 2, 2678)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000011', N'0000000002', N'Anatoly', N'Karpov', N'Member', 3, 2345)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000012', N'0000000002', N'Svetozar', N'Gligoric', N'Member', 4, 2654)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000013', N'0000000003', N'Harley', N'Wiley', N'Captain', 1, 2876)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000014', N'0000000003', N'Abbie', N'Harper', N'Cr Captain', 2, 2357)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000015', N'0000000003', N'Fintan', N'Bentley', N'Member', 3, 1235)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000016', N'0000000003', N'Tyson', N'Church', N'Member', 4, 2854)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000017', N'0000000005', N'Philippa', N'Bob', N'Captain', 1, 2765)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000018', N'0000000005', N'Amal', N'Ewing', N'Cr Captain', 2, 6543)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000019', N'0000000005', N'Damian', N'Hicks', N'Member', 3, 1543)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000020', N'0000000005', N'Efa', N'Hess', N'Member', 4, 2876)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000021', N'0000000006', N'Clement', N'Hayward', N'Captain', 1, 2573)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000022', N'0000000006', N'Amos', N'Bravo', NULL, 2, 1654)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000023', N'0000000006', N'Adele', N'Halliday', N'Member', 3, 2987)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000024', N'0000000006', N'Quentin', N'Gibbs', N'Member', 4, 2386)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000025', N'0000000007', N'Jeremy', N'Werner', N'Captain', 1, 2987)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000026', N'0000000007', N'James', N'Hancock', N'Cr Captain', 2, 2853)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000027', N'0000000007', N'Kory', N'Vargas', N'Member', 3, 2579)
INSERT [dbo].[ChessPlayers] ([ChessPlayersID], [ChessTeamID], [Name], [Surname], [Position], [TableNo], [ELO]) VALUES (N'0000000028', N'0000000007', N'Alissia', N'Rasmussen', N'Member', 4, 2598)
INSERT [dbo].[ChessTeams] ([ChessTeamID], [Name], [Country], [Slogan]) VALUES (N'0000000001', N'Dragon', N'British', N'All is Well')
INSERT [dbo].[ChessTeams] ([ChessTeamID], [Name], [Country], [Slogan]) VALUES (N'0000000002', N'Luna', N'USA', N'is All Well')
INSERT [dbo].[ChessTeams] ([ChessTeamID], [Name], [Country], [Slogan]) VALUES (N'0000000003', N'Samurai', N'Japan', N'Well is All')
INSERT [dbo].[ChessTeams] ([ChessTeamID], [Name], [Country], [Slogan]) VALUES (N'0000000004', N'Horse', N'Turkey', N'Hersey Yolunda')
INSERT [dbo].[ChessTeams] ([ChessTeamID], [Name], [Country], [Slogan]) VALUES (N'0000000005', N'Lord', N'Italy', NULL)
INSERT [dbo].[ChessTeams] ([ChessTeamID], [Name], [Country], [Slogan]) VALUES (N'0000000006', N'Zeus', N'Greek', N'is Well All')
INSERT [dbo].[ChessTeams] ([ChessTeamID], [Name], [Country], [Slogan]) VALUES (N'0000000007', N'Ra', N'Egypt', N'All Well is')
INSERT [dbo].[Referees] ([RefereeID], [Name], [Surname], [Rank]) VALUES (N'0000000001', N'Grady               ', N'North               ', NULL)
INSERT [dbo].[Referees] ([RefereeID], [Name], [Surname], [Rank]) VALUES (N'0000000002', N'Dora                ', N'Davie               ', NULL)
INSERT [dbo].[Referees] ([RefereeID], [Name], [Surname], [Rank]) VALUES (N'0000000003', N'Caliou              ', N'Delgado             ', NULL)
INSERT [dbo].[Referees] ([RefereeID], [Name], [Surname], [Rank]) VALUES (N'0000000004', N'Michelle            ', N'Mccullough          ', NULL)
INSERT [dbo].[Referees] ([RefereeID], [Name], [Surname], [Rank]) VALUES (N'0000000005', N'Isobel              ', N'Green               ', N'Leader')
INSERT [dbo].[Rounds] ([RoundID], [Time], [Location]) VALUES (N'0000000001', CAST(N'2020-04-25T10:00:00' AS SmallDateTime), N'School')
INSERT [dbo].[Rounds] ([RoundID], [Time], [Location]) VALUES (N'0000000002', CAST(N'2020-04-25T14:00:00' AS SmallDateTime), N'School')
INSERT [dbo].[Rounds] ([RoundID], [Time], [Location]) VALUES (N'0000000003', CAST(N'2020-04-26T12:00:00' AS SmallDateTime), N'Mall Saloon')
INSERT [dbo].[Rounds] ([RoundID], [Time], [Location]) VALUES (N'0000000004', CAST(N'2020-05-01T10:00:00' AS SmallDateTime), N'School')
INSERT [dbo].[Rounds] ([RoundID], [Time], [Location]) VALUES (N'0000000005', CAST(N'2020-05-01T14:00:00' AS SmallDateTime), N'School')
INSERT [dbo].[Rounds] ([RoundID], [Time], [Location]) VALUES (N'0000000006', CAST(N'2020-05-02T12:00:00' AS SmallDateTime), N'Mall Saloon')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [TournamentCountry]) VALUES (N'0000000001', N'Great Chess', N'Turkey')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [TournamentCountry]) VALUES (N'0000000002', N'Mini Chess', N'British')
ALTER TABLE [dbo].[ChessGames]  WITH CHECK ADD  CONSTRAINT [FK_ChessGames_ChessTeams] FOREIGN KEY([TeamID2])
REFERENCES [dbo].[ChessTeams] ([ChessTeamID])
GO
ALTER TABLE [dbo].[ChessGames] CHECK CONSTRAINT [FK_ChessGames_ChessTeams]
GO
ALTER TABLE [dbo].[ChessGames]  WITH CHECK ADD  CONSTRAINT [FK_ChessGames_ChessTeams1] FOREIGN KEY([TeamID1])
REFERENCES [dbo].[ChessTeams] ([ChessTeamID])
GO
ALTER TABLE [dbo].[ChessGames] CHECK CONSTRAINT [FK_ChessGames_ChessTeams1]
GO
ALTER TABLE [dbo].[ChessGames]  WITH CHECK ADD  CONSTRAINT [FK_ChessGames_Referees] FOREIGN KEY([RefereeID])
REFERENCES [dbo].[Referees] ([RefereeID])
GO
ALTER TABLE [dbo].[ChessGames] CHECK CONSTRAINT [FK_ChessGames_Referees]
GO
ALTER TABLE [dbo].[ChessGames]  WITH CHECK ADD  CONSTRAINT [FK_ChessGames_Rounds] FOREIGN KEY([RoundID])
REFERENCES [dbo].[Rounds] ([RoundID])
GO
ALTER TABLE [dbo].[ChessGames] CHECK CONSTRAINT [FK_ChessGames_Rounds]
GO
ALTER TABLE [dbo].[ChessGames]  WITH CHECK ADD  CONSTRAINT [FK_ChessGames_Tournaments] FOREIGN KEY([TournamentID])
REFERENCES [dbo].[Tournaments] ([TournamentID])
GO
ALTER TABLE [dbo].[ChessGames] CHECK CONSTRAINT [FK_ChessGames_Tournaments]
GO
ALTER TABLE [dbo].[ChessPlayers]  WITH CHECK ADD  CONSTRAINT [FK_ChessPlayers_ChessTeams] FOREIGN KEY([ChessTeamID])
REFERENCES [dbo].[ChessTeams] ([ChessTeamID])
GO
ALTER TABLE [dbo].[ChessPlayers] CHECK CONSTRAINT [FK_ChessPlayers_ChessTeams]
GO
USE [master]
GO
ALTER DATABASE [ChessTournament] SET  READ_WRITE 
GO
