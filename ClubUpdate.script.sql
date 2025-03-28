USE [master]
GO
/****** Object:  Database [ClubMana]    Script Date: 04/03/2025 8:34:45 CH ******/
CREATE DATABASE [ClubMana]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClubMana_', FILENAME = N'D:\FPT Documents\MSSQL16.MSSQLSERVER\MSSQL\DATA\ClubMana_.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClubMana__log', FILENAME = N'D:\FPT Documents\MSSQL16.MSSQLSERVER\MSSQL\DATA\ClubMana__log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ClubMana] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClubMana].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClubMana] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClubMana] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClubMana] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClubMana] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClubMana] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClubMana] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClubMana] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClubMana] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClubMana] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClubMana] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClubMana] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClubMana] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClubMana] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClubMana] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClubMana] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClubMana] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClubMana] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClubMana] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClubMana] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClubMana] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClubMana] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClubMana] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClubMana] SET RECOVERY FULL 
GO
ALTER DATABASE [ClubMana] SET  MULTI_USER 
GO
ALTER DATABASE [ClubMana] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClubMana] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClubMana] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClubMana] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClubMana] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClubMana] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ClubMana', N'ON'
GO
ALTER DATABASE [ClubMana] SET QUERY_STORE = ON
GO
ALTER DATABASE [ClubMana] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ClubMana]
GO
/****** Object:  Table [dbo].[Clubs]    Script Date: 04/03/2025 8:34:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clubs](
	[clubId] [int] IDENTITY(1,1) NOT NULL,
	[clubName] [varchar](100) NOT NULL,
	[description] [text] NULL,
	[establishedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[clubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventParticipants]    Script Date: 04/03/2025 8:34:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventParticipants](
	[eventParticipantId] [int] IDENTITY(1,1) NOT NULL,
	[eventId] [int] NULL,
	[userId] [int] NULL,
	[statusId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[eventParticipantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 04/03/2025 8:34:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[eventId] [int] IDENTITY(1,1) NOT NULL,
	[eventName] [varchar](100) NOT NULL,
	[description] [text] NULL,
	[eventDate] [datetime] NOT NULL,
	[location] [varchar](200) NOT NULL,
	[clubId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[eventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 04/03/2025 8:34:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[reportId] [int] IDENTITY(1,1) NOT NULL,
	[clubId] [int] NULL,
	[semester] [varchar](20) NOT NULL,
	[memberChanges] [text] NULL,
	[eventSummary] [text] NULL,
	[participationStats] [text] NULL,
	[createdDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[reportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/03/2025 8:34:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 04/03/2025 8:34:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[statusId] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/03/2025 8:34:46 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[roleId] [int] NULL,
	[clubId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clubs] ON 

INSERT [dbo].[Clubs] ([clubId], [clubName], [description], [establishedDate]) VALUES (1, N'FPTU Monstage Club', N'kaka', CAST(N'2016-08-15' AS Date))
INSERT [dbo].[Clubs] ([clubId], [clubName], [description], [establishedDate]) VALUES (2, N'FU Street Workout', N'CLB dành cho các b?n có dam mê b? môn Street Workout/Calisthenics t?i ÐH FPT Hà N?i', CAST(N'2019-04-10' AS Date))
INSERT [dbo].[Clubs] ([clubId], [clubName], [description], [establishedDate]) VALUES (3, N'FPTU Data Science Club ', N'Community for high-end fashion brand enthusiasts', CAST(N'2021-11-05' AS Date))
SET IDENTITY_INSERT [dbo].[Clubs] OFF
GO
SET IDENTITY_INSERT [dbo].[EventParticipants] ON 

INSERT [dbo].[EventParticipants] ([eventParticipantId], [eventId], [userId], [statusId]) VALUES (1, 1, 1, 2)
INSERT [dbo].[EventParticipants] ([eventParticipantId], [eventId], [userId], [statusId]) VALUES (2, 1, 3, 1)
INSERT [dbo].[EventParticipants] ([eventParticipantId], [eventId], [userId], [statusId]) VALUES (3, 2, 2, 2)
INSERT [dbo].[EventParticipants] ([eventParticipantId], [eventId], [userId], [statusId]) VALUES (4, 3, 4, 3)
SET IDENTITY_INSERT [dbo].[EventParticipants] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([eventId], [eventName], [description], [eventDate], [location], [clubId]) VALUES (1, N'Fashion Week Showcase', N'Runway event featuring emerging designers', CAST(N'2025-03-10T18:00:00.000' AS DateTime), N'Grand Ballroom', 1)
INSERT [dbo].[Events] ([eventId], [eventName], [description], [eventDate], [location], [clubId]) VALUES (2, N'Model Training Workshop', N'Professional catwalk & posing class', CAST(N'2025-04-05T14:00:00.000' AS DateTime), N'Studio B', 1)
INSERT [dbo].[Events] ([eventId], [eventName], [description], [eventDate], [location], [clubId]) VALUES (3, N'Luxury Fashion Talk', N'Discussion on latest high-end fashion trends', CAST(N'2025-05-20T16:30:00.000' AS DateTime), N'Luxury Lounge', 3)
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Reports] ON 

INSERT [dbo].[Reports] ([reportId], [clubId], [semester], [memberChanges], [eventSummary], [participationStats], [createdDate]) VALUES (1, 1, N'Spring 2025', N'15 new members joined', N'Fashion Week Showcase attracted a large audience', N'90% participation rate', CAST(N'2025-03-03T08:02:10.367' AS DateTime))
INSERT [dbo].[Reports] ([reportId], [clubId], [semester], [memberChanges], [eventSummary], [participationStats], [createdDate]) VALUES (2, 2, N'Spring 2025', N'5 top models graduated', N'Model Training Workshop was highly successful', N'85% participation rate', CAST(N'2025-03-03T08:02:10.367' AS DateTime))
INSERT [dbo].[Reports] ([reportId], [clubId], [semester], [memberChanges], [eventSummary], [participationStats], [createdDate]) VALUES (3, 3, N'Spring 2025', N'10% increase in membership', N'Luxury Fashion Talk covered the latest trends', N'75% participation rate', CAST(N'2025-03-03T08:02:10.367' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reports] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'Chairman')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (3, N'ViceChairman')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (4, N'TeamLeader')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (5, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([statusId], [statusName]) VALUES (1, N'Registered')
INSERT [dbo].[Status] ([statusId], [statusName]) VALUES (2, N'Attended')
INSERT [dbo].[Status] ([statusId], [statusName]) VALUES (3, N'Absent')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userId], [fullName], [email], [password], [roleId], [clubId]) VALUES (1, N'David Nguyen', N'david.nguyen@example.com', N'hashedpassword1', 1, 1)
INSERT [dbo].[Users] ([userId], [fullName], [email], [password], [roleId], [clubId]) VALUES (2, N'Sophia Tran', N'sophia.tran@example.com', N'hashedpassword2', 2, 2)
INSERT [dbo].[Users] ([userId], [fullName], [email], [password], [roleId], [clubId]) VALUES (3, N'Michael Le', N'michael.le@example.com', N'hashedpassword3', 3, 1)
INSERT [dbo].[Users] ([userId], [fullName], [email], [password], [roleId], [clubId]) VALUES (4, N'Jessica Pham', N'jessica.pham@example.com', N'hashedpassword4', 4, 3)
INSERT [dbo].[Users] ([userId], [fullName], [email], [password], [roleId], [clubId]) VALUES (5, N'Emma Vo', N'emma.vo@example.com', N'hashedpassword5', 5, 2)
INSERT [dbo].[Users] ([userId], [fullName], [email], [password], [roleId], [clubId]) VALUES (6, N'trungdam', N'trungdam1305@gmail.com', N'trung123', 5, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E61643159B268]    Script Date: 04/03/2025 8:34:46 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[EventParticipants]  WITH CHECK ADD FOREIGN KEY([eventId])
REFERENCES [dbo].[Events] ([eventId])
GO
ALTER TABLE [dbo].[EventParticipants]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([statusId])
GO
ALTER TABLE [dbo].[EventParticipants]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD FOREIGN KEY([clubId])
REFERENCES [dbo].[Clubs] ([clubId])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([clubId])
REFERENCES [dbo].[Clubs] ([clubId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([clubId])
REFERENCES [dbo].[Clubs] ([clubId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
USE [master]
GO
ALTER DATABASE [ClubMana] SET  READ_WRITE 
GO
