USE [PROG260FA23]
GO
ALTER TABLE [dbo].[Maps] DROP CONSTRAINT [FK_Maps_Maps]
GO
ALTER TABLE [dbo].[Characters] DROP CONSTRAINT [Map_ID]
GO
ALTER TABLE [dbo].[Characters] DROP CONSTRAINT [Character_Details_ID]
GO
/****** Object:  Table [dbo].[Maps]    Script Date: 10/25/2023 11:37:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Maps]') AND type in (N'U'))
DROP TABLE [dbo].[Maps]
GO
/****** Object:  Table [dbo].[Characters_Unmodified]    Script Date: 10/25/2023 11:37:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Characters_Unmodified]') AND type in (N'U'))
DROP TABLE [dbo].[Characters_Unmodified]
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 10/25/2023 11:37:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Characters]') AND type in (N'U'))
DROP TABLE [dbo].[Characters]
GO
/****** Object:  Table [dbo].[Character_Details]    Script Date: 10/25/2023 11:37:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character_Details]') AND type in (N'U'))
DROP TABLE [dbo].[Character_Details]
GO
/****** Object:  Table [dbo].[Character_Details]    Script Date: 10/25/2023 11:37:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character_Details](
	[Character_Details_ID] [int] IDENTITY(1,1) NOT NULL,
	[Original_Character] [nvarchar](50) NULL,
	[Sword_Fighter] [nvarchar](50) NULL,
	[Magic_User] [nvarchar](50) NULL,
 CONSTRAINT [PK_Character_Details] PRIMARY KEY CLUSTERED 
(
	[Character_Details_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 10/25/2023 11:37:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Character] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Map_ID] [int] NULL,
	[Character_Details_ID] [int] NOT NULL,
 CONSTRAINT [PK_Characters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Characters_Unmodified]    Script Date: 10/25/2023 11:37:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters_Unmodified](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Character] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Map_Location] [nvarchar](50) NULL,
	[Original_Character] [nvarchar](50) NULL,
	[Sword_Fighter] [nvarchar](50) NULL,
	[Magic_User] [nvarchar](50) NULL,
 CONSTRAINT [PK_Characters_Unmodified] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maps]    Script Date: 10/25/2023 11:37:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maps](
	[Map_ID] [int] IDENTITY(1,1) NOT NULL,
	[Map_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Maps] PRIMARY KEY CLUSTERED 
(
	[Map_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Character_Details] ON 

INSERT [dbo].[Character_Details] ([Character_Details_ID], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (1, N'FALSE', N'FALSE', N'FALSE')
INSERT [dbo].[Character_Details] ([Character_Details_ID], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (2, N'TRUE', N'FALSE', N'FALSE')
INSERT [dbo].[Character_Details] ([Character_Details_ID], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (3, N'TRUE', N'TRUE', N'FALSE')
INSERT [dbo].[Character_Details] ([Character_Details_ID], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (4, N'TRUE', N'TRUE', N'TRUE')
INSERT [dbo].[Character_Details] ([Character_Details_ID], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (5, N'FALSE', N'TRUE', N'FALSE')
INSERT [dbo].[Character_Details] ([Character_Details_ID], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (6, N'FALSE', N'FALSE', N'TRUE')
INSERT [dbo].[Character_Details] ([Character_Details_ID], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (7, N'FALSE', N'FALSE', NULL)
INSERT [dbo].[Character_Details] ([Character_Details_ID], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (8, N'FALSE', NULL, N'FALSE')
INSERT [dbo].[Character_Details] ([Character_Details_ID], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (9, N'TRUE', N'FALSE', NULL)
INSERT [dbo].[Character_Details] ([Character_Details_ID], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (10, N'TRUE', N'FALSE', N'TRUE')
SET IDENTITY_INSERT [dbo].[Character_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Characters] ON 

INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (1, N'Murray', N'Ghost', NULL, 1)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (2, N'Locke Smith', N'Human', 1, 1)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (3, N'Herman Toothrot', NULL, 2, 7)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (4, N'Voodoo Lady', N'Melee Island', 1, 10)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (5, N'Otis', N'Inmate', 1, 3)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (9, N'Carla', N'Pirate', 1, 3)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (11, N'Captain Madison', N'Pirate', 1, 5)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (12, N'Judge Planke', N'NPC', 3, 1)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (13, N'Boybrush Threepwood', N'Human', NULL, 8)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (14, N'Guybrush Threepwood', N'Mighty Pirate', NULL, 9)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (15, N'Elain Marley', N'Politician', 4, 3)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (16, N'Captain LeChuck', N'Ghost Pirate', 5, 4)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (17, N'Putra', N'Ghost Cook', 5, 1)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (19, N'Iron Rose', N'Ghost Pirate', 5, 5)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (21, N'Ned', N'Human', NULL, 2)
INSERT [dbo].[Characters] ([ID], [Character], [Type], [Map_ID], [Character_Details_ID]) VALUES (22, N'Flambe', N'Fire Ghost', 5, 6)
SET IDENTITY_INSERT [dbo].[Characters] OFF
GO
SET IDENTITY_INSERT [dbo].[Characters_Unmodified] ON 

INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (1, N'Murray', N' Ghost', NULL, N'TRUE', N'FALSE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (2, N'Locke Smith', N' Human', N'Melee Island', N'FALSE', N'FALSE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (3, N'Herman Toothrot', NULL, N'Terror Island', N'FALSE', N'FALSE', NULL)
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (4, N'Voodoo Lady', N' Melee Island', N'Melee Island', N'TRUE', N'FALSE', N'TRUE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (5, N'Otis', N' Inmate', N'Melee Island', N'TRUE', N'TRUE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (6, N'Carla', N' Pirate', N'Melee Island', N'TRUE', N'TRUE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (7, N'Captain Madison', N'Pirate', N'Melee Island', N'FALSE', N'TRUE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (8, N'Judge Planke', N'NPC', N'Brrrmuda', N'FALSE', N'FALSE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (9, N'Boybrush Threepwood', N'Human', NULL, N'FALSE', NULL, N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (10, N'Guybrush Threepwood', N'Mighty Pirate', NULL, N'TRUE', N'FALSE', NULL)
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (11, N'Elain Marley', N'Politician', N'Scurvy Island', N'TRUE', N'TRUE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (12, N'Captain LeChuck', N'Ghost Pirate', N'LeChuck''s ship', N'TRUE', N'TRUE', N'TRUE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (13, N'Putra', N'Ghost Cook', N'LeChuck''s ship', N'FALSE', N'FALSE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (14, N'Iron Rose', N'Ghost Pirate', N'LeChuck''s ship', N'FALSE', N'TRUE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (15, N'Ned', N'Human', NULL, N'TRUE', N'FALSE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (16, N'Flambe', N'Fire Ghost', N'LeChuck''s ship', N'FALSE', N'FALSE', N'TRUE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (17, N'Murray', N' Ghost', NULL, N'TRUE', N'FALSE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (18, N'Locke Smith', N' Human', N'Melee Island', N'FALSE', N'FALSE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (19, N'Herman Toothrot', NULL, N'Terror Island', N'FALSE', N'FALSE', NULL)
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (20, N'Voodoo Lady', N' Melee Island', N'Melee Island', N'TRUE', N'FALSE', N'TRUE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (21, N'Otis', N' Inmate', N'Melee Island', N'TRUE', N'TRUE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (22, N'Carla', N' Pirate', N'Melee Island', N'TRUE', N'TRUE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (23, N'Captain Madison', N'Pirate', N'Melee Island', N'FALSE', N'TRUE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (24, N'Judge Planke', N'NPC', N'Brrrmuda', N'FALSE', N'FALSE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (25, N'Boybrush Threepwood', N'Human', NULL, N'FALSE', NULL, N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (26, N'Guybrush Threepwood', N'Mighty Pirate', NULL, N'TRUE', N'FALSE', NULL)
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (27, N'Elain Marley', N'Politician', N'Scurvy Island', N'TRUE', N'TRUE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (28, N'Captain LeChuck', N'Ghost Pirate', N'LeChuck''s ship', N'TRUE', N'TRUE', N'TRUE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (29, N'Putra', N'Ghost Cook', N'LeChuck''s ship', N'FALSE', N'FALSE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (30, N'Iron Rose', N'Ghost Pirate', N'LeChuck''s ship', N'FALSE', N'TRUE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (31, N'Ned', N'Human', NULL, N'TRUE', N'FALSE', N'FALSE')
INSERT [dbo].[Characters_Unmodified] ([ID], [Character], [Type], [Map_Location], [Original_Character], [Sword_Fighter], [Magic_User]) VALUES (32, N'Flambe', N'Fire Ghost', N'LeChuck''s ship', N'FALSE', N'FALSE', N'TRUE')
SET IDENTITY_INSERT [dbo].[Characters_Unmodified] OFF
GO
SET IDENTITY_INSERT [dbo].[Maps] ON 

INSERT [dbo].[Maps] ([Map_ID], [Map_Name]) VALUES (1, N'Melee Island')
INSERT [dbo].[Maps] ([Map_ID], [Map_Name]) VALUES (2, N'Terror Island')
INSERT [dbo].[Maps] ([Map_ID], [Map_Name]) VALUES (3, N'Brrrmuda')
INSERT [dbo].[Maps] ([Map_ID], [Map_Name]) VALUES (4, N'Scurvy Island')
INSERT [dbo].[Maps] ([Map_ID], [Map_Name]) VALUES (5, N'LeChuck''s Ship')
SET IDENTITY_INSERT [dbo].[Maps] OFF
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [Character_Details_ID] FOREIGN KEY([Character_Details_ID])
REFERENCES [dbo].[Character_Details] ([Character_Details_ID])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [Character_Details_ID]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [Map_ID] FOREIGN KEY([Map_ID])
REFERENCES [dbo].[Maps] ([Map_ID])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [Map_ID]
GO
ALTER TABLE [dbo].[Maps]  WITH CHECK ADD  CONSTRAINT [FK_Maps_Maps] FOREIGN KEY([Map_ID])
REFERENCES [dbo].[Maps] ([Map_ID])
GO
ALTER TABLE [dbo].[Maps] CHECK CONSTRAINT [FK_Maps_Maps]
GO
