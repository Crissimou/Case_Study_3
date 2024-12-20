USE [master]
GO
/****** Object:  Database [ELearningPlatform]    Script Date: 18/12/2024 6:37:03 pm ******/
CREATE DATABASE [ELearningPlatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ELearningPlatform', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ELearningPlatform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ELearningPlatform_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ELearningPlatform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ELearningPlatform] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ELearningPlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ELearningPlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ELearningPlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ELearningPlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ELearningPlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ELearningPlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [ELearningPlatform] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ELearningPlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ELearningPlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ELearningPlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ELearningPlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ELearningPlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ELearningPlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ELearningPlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ELearningPlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ELearningPlatform] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ELearningPlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ELearningPlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ELearningPlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ELearningPlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ELearningPlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ELearningPlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ELearningPlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ELearningPlatform] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ELearningPlatform] SET  MULTI_USER 
GO
ALTER DATABASE [ELearningPlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ELearningPlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ELearningPlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ELearningPlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ELearningPlatform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ELearningPlatform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ELearningPlatform] SET QUERY_STORE = ON
GO
ALTER DATABASE [ELearningPlatform] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ELearningPlatform]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[Nationality] [nvarchar](50) NOT NULL,
	[Ethnicity] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NOT NULL,
	[ContactNumber] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[InstructorID] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[Duration] [nvarchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[Days] [nvarchar](50) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[EnrolleesID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[ScheduleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EnrolleesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_enrollee_sched]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_enrollee_sched]
AS
SELECT dbo.Students.FirstName, dbo.Students.LastName, dbo.Course.Title, dbo.Schedule.Days, dbo.Schedule.StartTime, dbo.Schedule.EndTime
FROM     dbo.Enrollment INNER JOIN
                  dbo.Schedule ON dbo.Enrollment.ScheduleID = dbo.Schedule.ScheduleID INNER JOIN
                  dbo.Students ON dbo.Enrollment.StudentID = dbo.Students.StudentID INNER JOIN
                  dbo.Course ON dbo.Enrollment.CourseID = dbo.Course.CourseID
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[AssignmentID] [int] IDENTITY(1,1) NOT NULL,
	[EnrolleesID] [int] NULL,
	[CourseID] [int] NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DueDate] [date] NULL,
	[SubmissionDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[EnrolleesID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Grade] [decimal](5, 2) NULL,
	[Remarks] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[InstructorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[Nationality] [nvarchar](50) NOT NULL,
	[Ethnicity] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NOT NULL,
	[ContactNumber] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[Nationality] [nvarchar](50) NOT NULL,
	[Ethnicity] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NOT NULL,
	[ContactNumber] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[PurchaseID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[PurchaseDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuccessfulEnrollments]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuccessfulEnrollments](
	[EnrollmentID] [int] NULL,
	[PurchaseDate] [date] NULL,
	[PaymentStatus] [nvarchar](20) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([userName], [password]) VALUES (N'crissostomo', N'ibarra123')
INSERT [dbo].[Admin] ([userName], [password]) VALUES (N'mercury', N'1122334455')
INSERT [dbo].[Admin] ([userName], [password]) VALUES (N'xoxo', N'a0823d01372b060edb4cba572ce6e23f7ca526096e447a561cc3d4de4aed367d')
GO
SET IDENTITY_INSERT [dbo].[Assignments] ON 

INSERT [dbo].[Assignments] ([AssignmentID], [EnrolleesID], [CourseID], [Title], [Description], [DueDate], [SubmissionDate], [Status]) VALUES (1, 1, 1, N'Final Project', N'Create a mobile app design using figma.', CAST(N'2024-12-10' AS Date), CAST(N'2024-12-11' AS Date), N'Overdue')
INSERT [dbo].[Assignments] ([AssignmentID], [EnrolleesID], [CourseID], [Title], [Description], [DueDate], [SubmissionDate], [Status]) VALUES (2, 1, 1, N'Object Oriented Programming', N'Create a simple e E-learning system.', CAST(N'2024-12-16' AS Date), CAST(N'2024-12-15' AS Date), N'Submitted')
INSERT [dbo].[Assignments] ([AssignmentID], [EnrolleesID], [CourseID], [Title], [Description], [DueDate], [SubmissionDate], [Status]) VALUES (3, 3, 2, N'Create a Dice app', N'A simple dice app using flutter.', CAST(N'2024-12-26' AS Date), CAST(N'2024-12-25' AS Date), N'Submitted')
INSERT [dbo].[Assignments] ([AssignmentID], [EnrolleesID], [CourseID], [Title], [Description], [DueDate], [SubmissionDate], [Status]) VALUES (4, 1, 1, N'Create a UI Design', N'Use figma and other utilities.', CAST(N'2024-12-05' AS Date), NULL, N'Pending')
INSERT [dbo].[Assignments] ([AssignmentID], [EnrolleesID], [CourseID], [Title], [Description], [DueDate], [SubmissionDate], [Status]) VALUES (5, 2, 1, N'Create a UI Design', N'Use figma and other utilities.', CAST(N'2024-12-05' AS Date), NULL, N'Pending')
INSERT [dbo].[Assignments] ([AssignmentID], [EnrolleesID], [CourseID], [Title], [Description], [DueDate], [SubmissionDate], [Status]) VALUES (6, 4, 1, N'Create a UI Design', N'Use figma and other utilities.', CAST(N'2024-12-05' AS Date), CAST(N'2024-12-06' AS Date), N'Overdue')
INSERT [dbo].[Assignments] ([AssignmentID], [EnrolleesID], [CourseID], [Title], [Description], [DueDate], [SubmissionDate], [Status]) VALUES (7, 1, 1, N'Create a Website Design', N'Use the plug-ins that we discussed in the previous lesson.', CAST(N'2004-12-24' AS Date), NULL, N'Pending')
INSERT [dbo].[Assignments] ([AssignmentID], [EnrolleesID], [CourseID], [Title], [Description], [DueDate], [SubmissionDate], [Status]) VALUES (8, 2, 1, N'Create a Website Design', N'Use the plug-ins that we discussed in the previous lesson.', CAST(N'2004-12-24' AS Date), NULL, N'Pending')
INSERT [dbo].[Assignments] ([AssignmentID], [EnrolleesID], [CourseID], [Title], [Description], [DueDate], [SubmissionDate], [Status]) VALUES (9, 4, 1, N'Create a Website Design', N'Use the plug-ins that we discussed in the previous lesson.', CAST(N'2004-12-24' AS Date), NULL, N'Pending')
INSERT [dbo].[Assignments] ([AssignmentID], [EnrolleesID], [CourseID], [Title], [Description], [DueDate], [SubmissionDate], [Status]) VALUES (10, 5, 1, N'Create a Website Design', N'Use the plug-ins that we discussed in the previous lesson.', CAST(N'2004-12-24' AS Date), NULL, N'Pending')
SET IDENTITY_INSERT [dbo].[Assignments] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [Title], [Description], [InstructorID], [Capacity], [Duration], [Price]) VALUES (1, N'Full Course Figma BootCamp', N'In this course you will learn how to use figma. A beginner friendly course equipped with resources that you have not seen before. You will not regret purchasing this course.', 1, 100, N'4.5 hr', CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Course] ([CourseID], [Title], [Description], [InstructorID], [Capacity], [Duration], [Price]) VALUES (2, N'Flutter and Dart Full Tutorial', N'A beginner friendly course where you will learn the basics of flutter and dart.', 2, 999999, N'23.5 hr', CAST(399.00 AS Decimal(10, 2)))
INSERT [dbo].[Course] ([CourseID], [Title], [Description], [InstructorID], [Capacity], [Duration], [Price]) VALUES (3, N'Python', N'A programming lanuage for pythn course', 32, 20, N'3', CAST(15000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Enrollment] ON 

INSERT [dbo].[Enrollment] ([EnrolleesID], [StudentID], [CourseID], [ScheduleID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Enrollment] ([EnrolleesID], [StudentID], [CourseID], [ScheduleID]) VALUES (2, 2, 1, 2)
INSERT [dbo].[Enrollment] ([EnrolleesID], [StudentID], [CourseID], [ScheduleID]) VALUES (3, 3, 2, 3)
INSERT [dbo].[Enrollment] ([EnrolleesID], [StudentID], [CourseID], [ScheduleID]) VALUES (4, 3, 1, 4)
INSERT [dbo].[Enrollment] ([EnrolleesID], [StudentID], [CourseID], [ScheduleID]) VALUES (5, 26, 1, 5)
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
GO
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([GradeID], [EnrolleesID], [CourseID], [Grade], [Remarks]) VALUES (1, 1, 1, CAST(95.00 AS Decimal(5, 2)), N'You di well. Keep it up!')
INSERT [dbo].[Grades] ([GradeID], [EnrolleesID], [CourseID], [Grade], [Remarks]) VALUES (2, 3, 2, CAST(85.00 AS Decimal(5, 2)), N'Just a little push. You can make it!')
INSERT [dbo].[Grades] ([GradeID], [EnrolleesID], [CourseID], [Grade], [Remarks]) VALUES (3, 3, 2, CAST(95.00 AS Decimal(5, 2)), N'Good Job')
INSERT [dbo].[Grades] ([GradeID], [EnrolleesID], [CourseID], [Grade], [Remarks]) VALUES (5, 5, 1, CAST(76.00 AS Decimal(5, 2)), N'Almost there!')
SET IDENTITY_INSERT [dbo].[Grades] OFF
GO
SET IDENTITY_INSERT [dbo].[Instructors] ON 

INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (1, N'Charmaine', N'Chakrata', NULL, CAST(N'2000-02-12' AS Date), 24, N'Female', N'Indian', NULL, N'Jakarta, Indonesia', N'12424535364', N'chakratacharmaine@gmail.com')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (2, N'Johan', N'Hanas', NULL, CAST(N'2001-10-24' AS Date), 23, N'Male', N'American', NULL, N'Toronto, Canada', N'72817382918', N'johanhanas@gmail.com')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (32, N'David', N'Clark', NULL, CAST(N'1980-03-15' AS Date), 44, N'Male', N'American', N'Caucasian', N'123 Faculty Rd, Boston, MA', N'5551231234', N'david.clark@example.com')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (33, N'Sarah', N'Johnson', N'Marie', CAST(N'1975-11-25' AS Date), 49, N'Female', N'Canadian', N'Caucasian', N'456 Maple St, Toronto, CA', N'1416555234', N'sarah.johnson@example.ca')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (34, N'Mohammed', N'Ali', N'Ahmed', CAST(N'1985-07-10' AS Date), 39, N'Male', N'Egyptian', N'Arab', N'789 Nile Rd, Cairo, EG', N'01555987654', N'mohammed.ali@example.eg')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (35, N'Ananya', N'Singh', N'Priya', CAST(N'1988-02-20' AS Date), 36, N'Female', N'Indian', N'Asian', N'123 Bollywood St, Mumbai, IN', N'91984567890', N'ananya.singh@example.in')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (36, N'Hiroshi', N'Tanaka', NULL, CAST(N'1978-08-15' AS Date), 46, N'Male', N'Japanese', N'Asian', N'456 Sakura St, Tokyo, JP', N'81356789123', N'hiroshi.tanaka@example.jp')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (37, N'Laura', N'Martinez', N'Elena', CAST(N'1983-04-25' AS Date), 41, N'Female', N'Mexican', N'Hispanic', N'789 Cactus Rd, Mexico City, MX', N'52555678901', N'laura.martinez@example.mx')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (38, N'Michael', N'Brown', N'James', CAST(N'1972-09-12' AS Date), 52, N'Male', N'British', N'European', N'123 Abbey Rd, London, UK', N'41234567891', N'michael.brown@example.co.uk')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (39, N'Chin', N'Lee', NULL, CAST(N'1986-06-30' AS Date), 38, N'Female', N'Chinese', N'Asian', N'456 Dragon St, Beijing, CN', N'86123456789', N'chin.lee@example.cn')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (40, N'Ethan', N'Nguyen', N'Bao', CAST(N'1989-10-18' AS Date), 35, N'Male', N'Vietnamese', N'Asian', N'789 Lotus St, Hanoi, VN', N'84987654321', N'ethan.nguyen@example.vn')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (41, N'Isabella', N'Rossi', N'Maria', CAST(N'1982-05-01' AS Date), 42, N'Female', N'Italian', N'European', N'123 Vatican Rd, Rome, IT', N'39012345678', N'isabella.rossi@example.it')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (42, N'Noah', N'Wilson', NULL, CAST(N'1984-03-22' AS Date), 40, N'Male', N'Australian', N'Caucasian', N'456 Kangaroo Rd, Sydney, AU', N'14456789123', N'noah.wilson@example.au')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (43, N'Sophia', N'Petrov', N'Ivanovna', CAST(N'1977-12-12' AS Date), 47, N'Female', N'Russian', N'Slavic', N'789 Kremlin St, Moscow, RU', N'79161234567', N'sophia.petrov@example.ru')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (44, N'Lucas', N'Garcia', N'Francisco', CAST(N'1981-01-08' AS Date), 43, N'Male', N'Brazilian', N'Latino', N'123 Carnival Rd, Rio de Janeiro, BR', N'52199876542', N'lucas.garcia@example.br')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (45, N'Olivia', N'Kim', N'Jae', CAST(N'1990-07-07' AS Date), 34, N'Female', N'Korean', N'Asian', N'456 Han River Rd, Seoul, KR', N'21012345678', N'olivia.kim@example.kr')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (46, N'Benjamin', N'Miller', NULL, CAST(N'1979-11-09' AS Date), 45, N'Male', N'German', N'European', N'789 Berlin Rd, Berlin, DE', N'49151234567', N'benjamin.miller@example.de')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (47, N'Emma', N'Evans', N'Grace', CAST(N'1987-04-18' AS Date), 37, N'Female', N'New Zealander', N'Maori', N'123 Kiwi Rd, Auckland, NZ', N'42123456789', N'emma.evans@example.nz')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (48, N'James', N'Smith', N'Edward', CAST(N'1983-06-03' AS Date), 41, N'Male', N'South African', N'African', N'456 Table St, Cape Town, ZA', N'27821234567', N'james.smith@example.za')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (49, N'Maya', N'Abdullah', N'Ali', CAST(N'1985-08-20' AS Date), 39, N'Female', N'Saudi', N'Arab', N'789 Desert Rd, Riyadh, SA', N'96655512345', N'maya.abdullah@example.sa')
INSERT [dbo].[Instructors] ([InstructorID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (50, N'William', N'Zhang', NULL, CAST(N'1992-12-25' AS Date), 31, N'Male', N'Singaporean', N'Asian', N'123 Orchard Rd, Singapore, SG', N'59876543210', N'william.zhang@example.sg')
SET IDENTITY_INSERT [dbo].[Instructors] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (1, N'Philip Neel', N'Babagonio', N'Hinong', CAST(N'2004-10-24' AS Date), 20, N'Male', N'Filipino', N'Ilonggo', N'Sto. Nino, South Cotabato', N'09978142880', N's.pnhbabagonio@usm.edu.ph', N'Student', CAST(N'2024-11-29T18:51:17.440' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (2, N'Akash', N'Punjab', NULL, CAST(N'1945-01-23' AS Date), 49, N'Male', N'Filipino', NULL, N'Davao, City', N'09837347586', N'akashpunjab@gmail.com', N'Student', CAST(N'2024-11-30T07:31:58.720' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (3, N'Charmaine', N'Chakrata', NULL, CAST(N'2000-02-12' AS Date), 24, N'Female', N'Indian', NULL, N'Jakarta, Indonesia', N'12424535364', N'chakratacharmaine@gmail.com', N'Instructor', CAST(N'2024-11-30T07:38:55.953' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (4, N'Charlotte', N'Carmona', N'Pudadera', CAST(N'2024-05-14' AS Date), 20, N'Female', N'Filipino', N'Bisaya', N'Polomolok, South Cotabato', N'09283819313', N's.cpcarmona@usm.edu.ph', N'Student', CAST(N'2024-12-02T02:21:27.070' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (5, N'Johan', N'Hanas', NULL, CAST(N'2001-10-24' AS Date), 23, N'Male', N'American', NULL, N'Toronto, Canada', N'72817382918', N'johanhanas@gmail.com', N'Instructor', CAST(N'2024-12-02T03:32:45.573' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (6, N'Logan', N'Yamamoto', N'Haru', CAST(N'2003-09-09' AS Date), 21, N'Male', N'Japanese', N'Asian', N'123 Sakura St, Tokyo, JP', N'81312345678', N'logan.yamamoto@example.jp', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (7, N'Chloe', N'Evans', N'Grace', CAST(N'2004-06-06' AS Date), 20, N'Female', N'New Zealander', N'Maori', N'789 Kiwi Rd, Auckland, NZ', N'64212345678', N'chloe.evans@example.nz', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (8, N'Benjamin', N'Lee', N'Jae', CAST(N'2003-12-12' AS Date), 21, N'Male', N'Singaporean', N'Asian', N'456 Orchard Rd, Singapore, SG', N'16591234567', N'benjamin.lee@example.sg', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (9, N'Isabella', N'Costa', N'Maria', CAST(N'2004-05-05' AS Date), 20, N'Female', N'Brazilian', N'Latino', N'123 Rio Rd, Rio de Janeiro, BR', N'55219876542', N'isabella.costa@example.br', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (10, N'Liam', N'Miller', NULL, CAST(N'2003-03-03' AS Date), 21, N'Male', N'German', N'European', N'789 Berliner Strasse, Berlin, DE', N'91512345679', N'liam.miller@example.de', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (11, N'Olivia', N'Petrov', N'Ivanovna', CAST(N'2004-02-02' AS Date), 20, N'Female', N'Russian', N'Slavic', N'456 Red Square, Moscow, RU', N'79161234567', N'olivia.petrov@example.ru', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (12, N'Noah', N'Abdullah', N'Ali', CAST(N'2003-08-15' AS Date), 21, N'Male', N'Egyptian', N'Arab', N'123 Nile St, Cairo, EG', N'20122345678', N'noah.abdullah@example.eg', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (13, N'Maya', N'Johnson', NULL, CAST(N'2004-12-25' AS Date), 19, N'Female', N'American', N'African-American', N'789 Liberty Rd, Atlanta, GA', N'14045551234', N'maya.johnson@example.com', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (14, N'James', N'Nguyen', N'Minh', CAST(N'2003-10-10' AS Date), 21, N'Male', N'Vietnamese', N'Asian', N'456 Bamboo St, Hanoi, VN', N'84912345678', N'james.nguyen@example.vn', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (15, N'Sophia', N'Martinez', N'Elena', CAST(N'2003-06-20' AS Date), 21, N'Female', N'Spanish', N'Hispanic', N'123 Olive St, Madrid, ES', N'34912345678', N'sophia.martinez@example.es', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (16, N'Ethan', N'Kim', NULL, CAST(N'2003-04-30' AS Date), 21, N'Male', N'Korean', N'Asian', N'789 Han River Rd, Seoul, KR', N'82102345678', N'ethan.kim@example.kr', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (17, N'Nina', N'Patel', N'Ravi', CAST(N'2004-01-08' AS Date), 20, N'Female', N'Indian', N'Asian', N'456 Curry Rd, Mumbai, IN', N'91987654321', N'nina.patel@example.in', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (18, N'Samuel', N'Wilson', N'Andrew', CAST(N'2002-09-25' AS Date), 22, N'Male', N'South African', N'African', N'123 Safari St, Cape Town, ZA', N'27821234567', N'samuel.wilson@example.za', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (19, N'Emma', N'Davis', NULL, CAST(N'2003-02-14' AS Date), 21, N'Female', N'Australian', N'European', N'789 Kangaroo Rd, Sydney, AU', N'61412345678', N'emma.davis@example.au', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (20, N'William', N'Brown', N'James', CAST(N'2003-11-01' AS Date), 21, N'Male', N'Canadian', N'Caucasian', N'123 Maple Ave, Toronto, CA', N'14245678643', N'william.brown@example.ca', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (21, N'Ling', N'Zhang', NULL, CAST(N'2004-07-05' AS Date), 20, N'Female', N'Chinese', N'Asian', N'456 Lotus St, Beijing, CN', N'23453432345', N'ling.zhang@example.cn', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (22, N'Aisha', N'Khan', N'Fatima', CAST(N'2003-03-18' AS Date), 21, N'Female', N'Pakistani', N'Asian', N'123 Jasmine Rd, Karachi, PK', N'66564565345', N'aisha.khan@example.pk', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (23, N'Carlos', N'Garcia', N'Luis', CAST(N'2002-12-10' AS Date), 22, N'Male', N'Mexican', N'Hispanic', N'789 Oak St, Mexico City, MX', N'11223311343', N'carlos.garcia@example.mx', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (24, N'Jane', N'Smith', N'Ann', CAST(N'2004-08-22' AS Date), 20, N'Female', N'British', N'European', N'456 Elm St, London, UK', N'12345454343', N'jane.smith@example.co.uk', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (25, N'John', N'Doe', NULL, CAST(N'2003-05-15' AS Date), 21, N'Male', N'American', N'Caucasian', N'123 Main St, Springfield, IL', N'55512345671', N'john.doe@example.com', N'Student', CAST(N'2024-12-03T10:52:12.750' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (26, N'Chloe', N'White', N'Anne', CAST(N'1989-01-30' AS Date), 35, N'Female', N'American', N'Caucasian', N'789 Liberty St, New York, NY', N'55578912341', N'chloe.white@example.com', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (27, N'William', N'Zhang', NULL, CAST(N'1992-12-25' AS Date), 31, N'Male', N'Singaporean', N'Asian', N'123 Orchard Rd, Singapore, SG', N'59876543210', N'william.zhang@example.sg', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (28, N'Maya', N'Abdullah', N'Ali', CAST(N'1985-08-20' AS Date), 39, N'Female', N'Saudi', N'Arab', N'789 Desert Rd, Riyadh, SA', N'96655512345', N'maya.abdullah@example.sa', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (29, N'James', N'Smith', N'Edward', CAST(N'1983-06-03' AS Date), 41, N'Male', N'South African', N'African', N'456 Table St, Cape Town, ZA', N'27821234567', N'james.smith@example.za', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (30, N'Emma', N'Evans', N'Grace', CAST(N'1987-04-18' AS Date), 37, N'Female', N'New Zealander', N'Maori', N'123 Kiwi Rd, Auckland, NZ', N'42123456789', N'emma.evans@example.nz', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (31, N'Benjamin', N'Miller', NULL, CAST(N'1979-11-09' AS Date), 45, N'Male', N'German', N'European', N'789 Berlin Rd, Berlin, DE', N'49151234567', N'benjamin.miller@example.de', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (32, N'Olivia', N'Kim', N'Jae', CAST(N'1990-07-07' AS Date), 34, N'Female', N'Korean', N'Asian', N'456 Han River Rd, Seoul, KR', N'21012345678', N'olivia.kim@example.kr', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (33, N'Lucas', N'Garcia', N'Francisco', CAST(N'1981-01-08' AS Date), 43, N'Male', N'Brazilian', N'Latino', N'123 Carnival Rd, Rio de Janeiro, BR', N'52199876542', N'lucas.garcia@example.br', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (34, N'Sophia', N'Petrov', N'Ivanovna', CAST(N'1977-12-12' AS Date), 47, N'Female', N'Russian', N'Slavic', N'789 Kremlin St, Moscow, RU', N'79161234567', N'sophia.petrov@example.ru', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (35, N'Noah', N'Wilson', NULL, CAST(N'1984-03-22' AS Date), 40, N'Male', N'Australian', N'Caucasian', N'456 Kangaroo Rd, Sydney, AU', N'14456789123', N'noah.wilson@example.au', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (36, N'Isabella', N'Rossi', N'Maria', CAST(N'1982-05-01' AS Date), 42, N'Female', N'Italian', N'European', N'123 Vatican Rd, Rome, IT', N'39012345678', N'isabella.rossi@example.it', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (37, N'Ethan', N'Nguyen', N'Bao', CAST(N'1989-10-18' AS Date), 35, N'Male', N'Vietnamese', N'Asian', N'789 Lotus St, Hanoi, VN', N'84987654321', N'ethan.nguyen@example.vn', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (38, N'Chin', N'Lee', NULL, CAST(N'1986-06-30' AS Date), 38, N'Female', N'Chinese', N'Asian', N'456 Dragon St, Beijing, CN', N'86123456789', N'chin.lee@example.cn', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (39, N'Michael', N'Brown', N'James', CAST(N'1972-09-12' AS Date), 52, N'Male', N'British', N'European', N'123 Abbey Rd, London, UK', N'41234567891', N'michael.brown@example.co.uk', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (40, N'Laura', N'Martinez', N'Elena', CAST(N'1983-04-25' AS Date), 41, N'Female', N'Mexican', N'Hispanic', N'789 Cactus Rd, Mexico City, MX', N'52555678901', N'laura.martinez@example.mx', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (41, N'Hiroshi', N'Tanaka', NULL, CAST(N'1978-08-15' AS Date), 46, N'Male', N'Japanese', N'Asian', N'456 Sakura St, Tokyo, JP', N'81356789123', N'hiroshi.tanaka@example.jp', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (42, N'Ananya', N'Singh', N'Priya', CAST(N'1988-02-20' AS Date), 36, N'Female', N'Indian', N'Asian', N'123 Bollywood St, Mumbai, IN', N'91984567890', N'ananya.singh@example.in', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (43, N'Mohammed', N'Ali', N'Ahmed', CAST(N'1985-07-10' AS Date), 39, N'Male', N'Egyptian', N'Arab', N'789 Nile Rd, Cairo, EG', N'01555987654', N'mohammed.ali@example.eg', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (44, N'Sarah', N'Johnson', N'Marie', CAST(N'1975-11-25' AS Date), 49, N'Female', N'Canadian', N'Caucasian', N'456 Maple St, Toronto, CA', N'1416555234', N'sarah.johnson@example.ca', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (45, N'David', N'Clark', NULL, CAST(N'1980-03-15' AS Date), 44, N'Male', N'American', N'Caucasian', N'123 Faculty Rd, Boston, MA', N'5551231234', N'david.clark@example.com', N'Instructor', CAST(N'2024-12-03T11:02:58.160' AS DateTime))
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email], [Role], [CreatedAt]) VALUES (46, N'Jessa', N'Angoy', N'Bustamante', CAST(N'2005-10-15' AS Date), 19, N'Female', N'Filipina', NULL, N'Kisante', N'09859945478', N'jessayonga@gmail.com', N'Student', CAST(N'2024-12-03T12:09:49.197' AS DateTime))
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchases] ON 

INSERT [dbo].[Purchases] ([PurchaseID], [StudentID], [CourseID], [PurchaseDate]) VALUES (1, 2, 1, CAST(N'2024-12-02T02:05:55.420' AS DateTime))
INSERT [dbo].[Purchases] ([PurchaseID], [StudentID], [CourseID], [PurchaseDate]) VALUES (2, 3, 2, CAST(N'2024-12-02T04:39:30.060' AS DateTime))
INSERT [dbo].[Purchases] ([PurchaseID], [StudentID], [CourseID], [PurchaseDate]) VALUES (3, 3, 1, CAST(N'2024-12-02T08:10:57.310' AS DateTime))
INSERT [dbo].[Purchases] ([PurchaseID], [StudentID], [CourseID], [PurchaseDate]) VALUES (4, 26, 1, CAST(N'2024-12-03T12:10:54.870' AS DateTime))
SET IDENTITY_INSERT [dbo].[Purchases] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([ScheduleID], [Days], [StartTime], [EndTime]) VALUES (1, N'Monday, Wednesday,Friday', CAST(N'07:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[Schedule] ([ScheduleID], [Days], [StartTime], [EndTime]) VALUES (2, N'Monday, Wednesday, Friday', CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[Schedule] ([ScheduleID], [Days], [StartTime], [EndTime]) VALUES (3, N'Saturday, Sunday, Monday', CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Schedule] ([ScheduleID], [Days], [StartTime], [EndTime]) VALUES (4, N'Tuesday, Thursday, Saturday', CAST(N'07:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[Schedule] ([ScheduleID], [Days], [StartTime], [EndTime]) VALUES (5, N'Monday', CAST(N'01:00:00' AS Time), CAST(N'03:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (1, N'Philip Neel', N'Babagonio', N'Hinong', CAST(N'2004-10-24' AS Date), 20, N'Male', N'Filipino', N'Ilonggo', N'Sto. Nino, South Cotabato', N'09978142880', N's.pnhbabagonio@usm.edu.ph')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (2, N'Akash', N'Punjab', NULL, CAST(N'1945-01-23' AS Date), 49, N'Male', N'Filipino', NULL, N'Davao, City', N'09837347586', N'akashpunjab@gmail.com')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (3, N'Charlotte', N'Carmona', N'Pudadera', CAST(N'2024-05-14' AS Date), 20, N'Female', N'Filipino', N'Bisaya', N'Polomolok, South Cotabato', N'09283819313', N's.cpcarmona@usm.edu.ph')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (6, N'John', N'Doe', NULL, CAST(N'2003-05-15' AS Date), 21, N'Male', N'American', N'Caucasian', N'123 Main St, Springfield, IL', N'55512345671', N'john.doe@example.com')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (7, N'Jane', N'Smith', N'Ann', CAST(N'2004-08-22' AS Date), 20, N'Female', N'British', N'European', N'456 Elm St, London, UK', N'12345454343', N'jane.smith@example.co.uk')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (8, N'Carlos', N'Garcia', N'Luis', CAST(N'2002-12-10' AS Date), 22, N'Male', N'Mexican', N'Hispanic', N'789 Oak St, Mexico City, MX', N'11223311343', N'carlos.garcia@example.mx')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (9, N'Aisha', N'Khan', N'Fatima', CAST(N'2003-03-18' AS Date), 21, N'Female', N'Pakistani', N'Asian', N'123 Jasmine Rd, Karachi, PK', N'66564565345', N'aisha.khan@example.pk')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (10, N'Ling', N'Zhang', NULL, CAST(N'2004-07-05' AS Date), 20, N'Female', N'Chinese', N'Asian', N'456 Lotus St, Beijing, CN', N'23453432345', N'ling.zhang@example.cn')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (11, N'William', N'Brown', N'James', CAST(N'2003-11-01' AS Date), 21, N'Male', N'Canadian', N'Caucasian', N'123 Maple Ave, Toronto, CA', N'14245678643', N'william.brown@example.ca')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (12, N'Emma', N'Davis', NULL, CAST(N'2003-02-14' AS Date), 21, N'Female', N'Australian', N'European', N'789 Kangaroo Rd, Sydney, AU', N'61412345678', N'emma.davis@example.au')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (13, N'Samuel', N'Wilson', N'Andrew', CAST(N'2002-09-25' AS Date), 22, N'Male', N'South African', N'African', N'123 Safari St, Cape Town, ZA', N'27821234567', N'samuel.wilson@example.za')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (14, N'Nina', N'Patel', N'Ravi', CAST(N'2004-01-08' AS Date), 20, N'Female', N'Indian', N'Asian', N'456 Curry Rd, Mumbai, IN', N'91987654321', N'nina.patel@example.in')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (15, N'Ethan', N'Kim', NULL, CAST(N'2003-04-30' AS Date), 21, N'Male', N'Korean', N'Asian', N'789 Han River Rd, Seoul, KR', N'82102345678', N'ethan.kim@example.kr')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (16, N'Sophia', N'Martinez', N'Elena', CAST(N'2003-06-20' AS Date), 21, N'Female', N'Spanish', N'Hispanic', N'123 Olive St, Madrid, ES', N'34912345678', N'sophia.martinez@example.es')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (17, N'James', N'Nguyen', N'Minh', CAST(N'2003-10-10' AS Date), 21, N'Male', N'Vietnamese', N'Asian', N'456 Bamboo St, Hanoi, VN', N'84912345678', N'james.nguyen@example.vn')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (18, N'Maya', N'Johnson', NULL, CAST(N'2004-12-25' AS Date), 19, N'Female', N'American', N'African-American', N'789 Liberty Rd, Atlanta, GA', N'14045551234', N'maya.johnson@example.com')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (19, N'Noah', N'Abdullah', N'Ali', CAST(N'2003-08-15' AS Date), 21, N'Male', N'Egyptian', N'Arab', N'123 Nile St, Cairo, EG', N'20122345678', N'noah.abdullah@example.eg')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (20, N'Olivia', N'Petrov', N'Ivanovna', CAST(N'2004-02-02' AS Date), 20, N'Female', N'Russian', N'Slavic', N'456 Red Square, Moscow, RU', N'79161234567', N'olivia.petrov@example.ru')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (21, N'Liam', N'Miller', NULL, CAST(N'2003-03-03' AS Date), 21, N'Male', N'German', N'European', N'789 Berliner Strasse, Berlin, DE', N'91512345679', N'liam.miller@example.de')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (22, N'Isabella', N'Costa', N'Maria', CAST(N'2004-05-05' AS Date), 20, N'Female', N'Brazilian', N'Latino', N'123 Rio Rd, Rio de Janeiro, BR', N'55219876542', N'isabella.costa@example.br')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (23, N'Benjamin', N'Lee', N'Jae', CAST(N'2003-12-12' AS Date), 21, N'Male', N'Singaporean', N'Asian', N'456 Orchard Rd, Singapore, SG', N'16591234567', N'benjamin.lee@example.sg')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (24, N'Chloe', N'Evans', N'Grace', CAST(N'2004-06-06' AS Date), 20, N'Female', N'New Zealander', N'Maori', N'789 Kiwi Rd, Auckland, NZ', N'64212345678', N'chloe.evans@example.nz')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [MiddleName], [DateOfBirth], [Age], [Gender], [Nationality], [Ethnicity], [Address], [ContactNumber], [Email]) VALUES (26, N'Jessa', N'Angoy', N'Bustamante', CAST(N'2005-10-15' AS Date), 19, N'Female', N'Filipina', NULL, N'Kisante', N'09859945478', N'jessayonga@gmail.com')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
INSERT [dbo].[SuccessfulEnrollments] ([EnrollmentID], [PurchaseDate], [PaymentStatus]) VALUES (1, CAST(N'2024-11-30' AS Date), N'Paid')
INSERT [dbo].[SuccessfulEnrollments] ([EnrollmentID], [PurchaseDate], [PaymentStatus]) VALUES (2, CAST(N'2024-12-02' AS Date), N'Paid')
INSERT [dbo].[SuccessfulEnrollments] ([EnrollmentID], [PurchaseDate], [PaymentStatus]) VALUES (3, CAST(N'2024-12-02' AS Date), N'Paid')
INSERT [dbo].[SuccessfulEnrollments] ([EnrollmentID], [PurchaseDate], [PaymentStatus]) VALUES (4, CAST(N'2024-12-02' AS Date), N'Paid')
INSERT [dbo].[SuccessfulEnrollments] ([EnrollmentID], [PurchaseDate], [PaymentStatus]) VALUES (5, CAST(N'2024-12-03' AS Date), N'Paid')
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Purchases] ADD  DEFAULT (getdate()) FOR [PurchaseDate]
GO
ALTER TABLE [dbo].[SuccessfulEnrollments] ADD  DEFAULT (getdate()) FOR [PurchaseDate]
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD FOREIGN KEY([EnrolleesID])
REFERENCES [dbo].[Enrollment] ([EnrolleesID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Instructors] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructors] ([InstructorID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Instructors]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ScheduleID])
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([EnrolleesID])
REFERENCES [dbo].[Enrollment] ([EnrolleesID])
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[SuccessfulEnrollments]  WITH CHECK ADD FOREIGN KEY([EnrollmentID])
REFERENCES [dbo].[Enrollment] ([EnrolleesID])
GO
ALTER TABLE [dbo].[Assignments]  WITH CHECK ADD CHECK  (([Status]='Overdue' OR [Status]='Submitted' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD CHECK  (([Grade]>=(0) AND [Grade]<=(100)))
GO
/****** Object:  StoredProcedure [dbo].[InsertInstructor]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create a stored procedure to insert data into the Students table
CREATE PROCEDURE [dbo].[InsertInstructor]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @MiddleName NVARCHAR(50) = NULL,
    @DateOfBirth DATE,
    @Age INT,
    @Gender NVARCHAR(50) = NULL,
    @Nationality NVARCHAR(50),
    @Ethnicity NVARCHAR(50) = NULL,
    @Address NVARCHAR(255),
    @ContactNumber NVARCHAR(11),
    @Email NVARCHAR(100)
AS
BEGIN
    INSERT INTO Instructors (
        FirstName,
        LastName,
        MiddleName,
        DateOfBirth,
        Age,
        Gender,
        Nationality,
        Ethnicity,
        Address,
        ContactNumber,
        Email
    )
    VALUES (
        @FirstName,
        @LastName,
        @MiddleName,
        @DateOfBirth,
        @Age,
        @Gender,
        @Nationality,
        @Ethnicity,
        @Address,
        @ContactNumber,
        @Email
    );
END
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoCourse]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create a stored procedure to insert data into the Students table
CREATE PROCEDURE [dbo].[InsertIntoCourse]
    @Title NVARCHAR(100),
    @Description NVARCHAR(255),
    @InstructorID INT ,
    @Capacity INT,
    @Duration NVARCHAR(50),
    @Price DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Course(
        Title,
        Description,
        InstructorID,
        Capacity,
        Duration,
        Price
    )
    VALUES (
        @Title,
        @Description,
        @InstructorID,
        @Capacity,
        @Duration,
        @Price
    );
END
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoEnrollment]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create a stored procedure to insert data into the Students table
CREATE PROCEDURE [dbo].[InsertIntoEnrollment]
    @StudentID INT,
    @CourseID INT,
    @ScheduleID INT
AS
BEGIN
    INSERT INTO Enrollment(
        StudentID,
        CourseID,
        ScheduleID
    )
    VALUES (
        @StudentID,
        @CourseID,
        @ScheduleID
		);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoSchedule]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create a stored procedure to insert data into the Students table
CREATE PROCEDURE [dbo].[InsertIntoSchedule]
    @Days NVARCHAR(50),
    @StartTime TIME,
	@EndTime TIME
AS
BEGIN
    INSERT INTO Schedule(
        Days,
        StartTime,
		EndTime
    )
    VALUES (
        @Days,
        @StartTime, 
        @EndTime
		);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create a stored procedure to insert data into the Students table
CREATE PROCEDURE [dbo].[InsertStudent]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @MiddleName NVARCHAR(50) = NULL,
    @DateOfBirth DATE,
    @Age INT,
    @Gender NVARCHAR(50) = NULL,
    @Nationality NVARCHAR(50),
    @Ethnicity NVARCHAR(50) = NULL,
    @Address NVARCHAR(255),
    @ContactNumber NVARCHAR(11),
    @Email NVARCHAR(100)
AS
BEGIN
    INSERT INTO Students (
        FirstName,
        LastName,
        MiddleName,
        DateOfBirth,
        Age,
        Gender,
        Nationality,
        Ethnicity,
        Address,
        ContactNumber,
        Email
    )
    VALUES (
        @FirstName,
        @LastName,
        @MiddleName,
        @DateOfBirth,
        @Age,
        @Gender,
        @Nationality,
        @Ethnicity,
        @Address,
        @ContactNumber,
        @Email
    );
END
GO
/****** Object:  Trigger [dbo].[after_enrollment_insert]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[after_enrollment_insert]
ON [dbo].[Enrollment]
AFTER INSERT
AS
BEGIN
    INSERT INTO SuccessfulEnrollments (
        EnrollmentID,
        PurchaseDate,
        PaymentStatus
    )
    SELECT 
        EnrolleesID, 
        GETDATE(),  -- Sets the purchase date to the current date
        'Paid'      -- Default payment status
    FROM inserted; -- 'inserted' contains the newly inserted rows in Enrollment
END;
GO
ALTER TABLE [dbo].[Enrollment] ENABLE TRIGGER [after_enrollment_insert]
GO
/****** Object:  Trigger [dbo].[trg_InsertInstructor]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Trigger for saving Instructor data into Person table
CREATE TRIGGER [dbo].[trg_InsertInstructor]
ON [dbo].[Instructors]
AFTER INSERT
AS
BEGIN
    INSERT INTO Person (FirstName, LastName, MiddleName, DateOfBirth, Age, Gender, Nationality, Ethnicity, Address, ContactNumber, Email, Role)
    SELECT FirstName, LastName, MiddleName, DateOfBirth, Age, Gender, Nationality, Ethnicity, Address, ContactNumber, Email, 'Instructor'
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Instructors] ENABLE TRIGGER [trg_InsertInstructor]
GO
/****** Object:  Trigger [dbo].[UpdateScheduleIDOnInsert]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UpdateScheduleIDOnInsert]
ON [dbo].[Schedule]
AFTER INSERT
AS
BEGIN
    -- Update the Enrollment table with the latest ScheduleID
    UPDATE Enrollment
    SET ScheduleID = (SELECT MAX(ScheduleID) FROM Schedule)
    WHERE ScheduleID IS NULL;
END;
GO
ALTER TABLE [dbo].[Schedule] ENABLE TRIGGER [UpdateScheduleIDOnInsert]
GO
/****** Object:  Trigger [dbo].[trg_InsertStudent]    Script Date: 18/12/2024 6:37:03 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsertStudent]
ON [dbo].[Students]
AFTER INSERT
AS
BEGIN
    INSERT INTO Person (FirstName, LastName, MiddleName, DateOfBirth, Age, Gender, Nationality, Ethnicity, Address, ContactNumber, Email, Role)
    SELECT FirstName, LastName, MiddleName, DateOfBirth, Age, Gender, Nationality, Ethnicity, Address, ContactNumber, Email, 'Student'
    FROM inserted;
END;

GO
ALTER TABLE [dbo].[Students] ENABLE TRIGGER [trg_InsertStudent]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[50] 4[11] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Enrollment"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Schedule"
            Begin Extent = 
               Top = 279
               Left = 303
               Bottom = 442
               Right = 497
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Students"
            Begin Extent = 
               Top = 26
               Left = 564
               Bottom = 189
               Right = 764
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course"
            Begin Extent = 
               Top = 221
               Left = 621
               Bottom = 384
               Right = 815
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_enrollee_sched'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_enrollee_sched'
GO
USE [master]
GO
ALTER DATABASE [ELearningPlatform] SET  READ_WRITE 
GO
