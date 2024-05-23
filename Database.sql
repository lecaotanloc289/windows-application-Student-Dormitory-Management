create database KTXVAA
alter database KTXVAA collate Vietnamese_100_CI_AI_KS_SC_UTF8;
USE [KTXVAA]
GO

/****** Object:  Table [dbo].[Students]    Script Date: 11/14/2023 7:36:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Students](
	[StudentID] [bigint] IDENTITY(2154810000,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DoB] [datetime2](7) NOT NULL,
	[Class] [nvarchar](max) NOT NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Rooms]    Script Date: 11/14/2023 7:37:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomType] [nvarchar](max) NOT NULL,
	[QuantityStudent] [int] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] IDENTITY(1000,1) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[StudentID] [bigint] NOT NULL,
	[RoomID] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Rooms_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Rooms_RoomID]
GO

ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Students_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Students_StudentID]
GO


CREATE TABLE [dbo].[Staffs](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


INSERT INTO Students
VALUES
('Nguyễn Văn Đạt', '2003-05-12', '21ĐHTT01', 'Nam','Hà Tĩnh' ),
('Trần Thị Hương', '2002-09-15', '21ĐHTT02', 'Nữ', 'Quảng Bình'),
('Phạm Văn An', '2003-07-03', '22ĐHTT01', 'Nam', 'Hải Phòng'),
('Lê Thị Lan', '2001-12-20', '22ĐHTT02', 'Nữ', 'Hà Nội'),
('Hoàng Văn Bình', '2002-04-08', '22ĐHTT03', 'Nam', 'Đà Nẵng'),
('Nguyễn Thị Thu', '2003-02-11', '22ĐHTT04', 'Nữ', 'Quảng Ngãi'),
('Trần Văn Tuấn', '2002-06-29', '22ĐHTT05', 'Nam', 'Hồ Chí Minh'),
('Lê Thị Mai', '2003-10-17', '22ĐHTT06', 'Nữ', 'Hải Dương'),
('Nguyễn Văn Hoàng', '2002-03-05', '22ĐHTT01', 'Nam', 'Nghệ An'),
('Phạm Thị Ngọc', '2001-11-23', '23ĐHTT01', 'Nữ', 'Hà Nam'),
('Trần Văn Quang', '2003-07-14', '23ĐHTT01', 'Nam', 'Bắc Ninh'),
('Đỗ Thị Hà', '2002-09-01', '23ĐHTT02', 'Nữ', 'Bình Dương'),
('Nguyễn Văn Hoa', '2003-05-18', '23ĐHTT03', 'Nam', 'Quảng Nam'),
('Lê Thị Ngân', '2002-08-26', '23ĐHTT04', 'Nữ', 'Thừa Thiên Huế'),
('Phan Văn Đức', '2001-12-09', '23ĐHTT05', 'Nam', 'Cần Thơ'),
('Bùi Thị Phương', '2003-01-04', '23ĐHTT06', 'Nữ', 'Kiên Giang');

INSERT INTO Staffs
VALUES
    ('Lê Cao Tấn Lộc', 'Hà Nội', '0123456781', 'admin', 'admin', 1),
    ('Nguyễn Thị Thúy Hà', 'Hồ Chí Minh', '0123456782', 'nv02_vaaktx', 'nv02_vaaktx', 2),
    ('Trịnh Vinh Qui', 'Hải Phòng', '0123456783', 'nv03_vaaktx', 'nv03_vaaktx', 2),    
	('Phan Tường Bảo Trâm', 'Bình Dương', '0123456784', 'nv04_vaaktx', 'nv04_vaaktx', 3),	
	('Đặng Hoàng Mai Uyên', 'Bình Phước', '0123456785', 'nv05_vaaktx', 'nv05_vaaktx', 3);

INSERT INTO  Rooms
VALUES 
('Nam', 6, 'Còn trống', 500000),
('Nam', 6, 'Còn trống', 500000),
('Nam', 8, 'Còn trống', 400000),
('Nam', 8, 'Còn trống', 400000),
('Nữ', 6, 'Còn trống', 500000),
('Nữ', 6, 'Còn trống', 500000),
('Nữ', 8, 'Còn trống', 400000),
('Nữ', 8, 'Còn trống', 400000);

INSERT INTO Contracts
VALUES 
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810000, 1, 500000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810004, 2, 500000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810006, 3, 400000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810008, 4, 400000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810010, 1, 500000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810012, 2, 500000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810014, 3, 400000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810016, 4, 400000),

('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810003, 5, 500000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810005, 5, 500000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810007, 5, 500000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810009, 6, 500000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810011, 7, 400000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810013, 8, 400000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810015, 5, 500000),
('07-30-2023 09:00:00','08-30-2024 09:00:00', 2154810017, 5, 500000);


