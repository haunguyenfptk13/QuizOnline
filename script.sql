USE [master]
GO
/****** Object:  Database [LAB231_QUIZONLINE]    Script Date: 6/2/2020 10:49:22 PM ******/
CREATE DATABASE [LAB231_QUIZONLINE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LAB231_QUIZONLINE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LAB231_QUIZONLINE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LAB231_QUIZONLINE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LAB231_QUIZONLINE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAB231_QUIZONLINE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET ARITHABORT OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET  MULTI_USER 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET QUERY_STORE = OFF
GO
USE [LAB231_QUIZONLINE]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 6/2/2020 10:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [varchar](20) NOT NULL,
	[question_content] [varchar](99) NOT NULL,
	[A1] [varchar](99) NOT NULL,
	[A3] [varchar](99) NOT NULL,
	[A2] [varchar](99) NOT NULL,
	[A4] [varchar](99) NOT NULL,
	[answer_correct] [varchar](1) NOT NULL,
	[createDate] [date] NULL,
	[subjectID] [varchar](20) NOT NULL,
	[statusID] [int] NOT NULL,
 CONSTRAINT [PK__Question__3213E83F357A8488] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz_History]    Script Date: 6/2/2020 10:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz_History](
	[quizID] [int] IDENTITY(1,1) NOT NULL,
	[subjectID] [varchar](20) NOT NULL,
	[number_correct] [int] NOT NULL,
	[point] [float] NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Quiz__CFF54C1D639BB738] PRIMARY KEY CLUSTERED 
(
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 6/2/2020 10:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[email] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[password] [varchar](250) NOT NULL,
	[roleID] [int] NOT NULL,
	[statusID] [int] NOT NULL,
 CONSTRAINT [PK__Registra__AB6E616502D33EE3] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/2/2020 10:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] NOT NULL,
	[roleName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/2/2020 10:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[statusID] [int] NOT NULL,
	[statusName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 6/2/2020 10:49:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectID] [varchar](20) NOT NULL,
	[subjectName] [varchar](50) NOT NULL,
	[numQuestion] [int] NOT NULL,
	[time] [int] NOT NULL,
 CONSTRAINT [PK__Subject__ACF9A740B6CA530E] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q01', N'This is Q01?', N'Yes', N'No', N'I don''t no', N'OK', N'A', CAST(N'2020-05-15' AS Date), N'PRJ321', 2)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q02', N'This is Q02?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q03', N'This is Q03?', N'Yes', N'No', N'I don''t no', N'OK', N'D', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q04', N'This is Q04?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q05', N'This is Q05?', N'Yes', N'No', N'I don''t no', N'OK', N'B', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q06', N'This is Q06?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q07', N'This is Q07?', N'Yes', N'No', N'I don''t no', N'OK', N'D', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q08', N'This is Q08?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q09', N'This is Q09?', N'Yes', N'No', N'I don''t no', N'OK', N'D', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q10', N'This is Q10?', N'Yes', N'No', N'I don''t no', N'OK', N'B', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q11', N'This is Q11?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q12', N'This is Q12?', N'Yes', N'No', N'I don''t no', N'OK', N'A', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q13', N'This is Q13?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q14', N'This is Q14?', N'Yes', N'No', N'I don''t no', N'OK', N'B', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q15', N'This is Q15?', N'Yes', N'No', N'I don''t no', N'OK', N'D', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q16', N'This is Q16?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q17', N'This is Q17?', N'Yes', N'No', N'I don''t no', N'OK', N'A', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q18', N'This is Q18?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q19', N'This is Q19?', N'Yes', N'No', N'I don''t no', N'OK', N'D', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q20', N'This is Q20?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q21', N'This is Q21?', N'Yes', N'Noo', N'I don''t no', N'OK', N'B', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q22', N'This is Q22?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q23', N'This is Q23?', N'Yes', N'No', N'I don''t no', N'OK', N'A', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q24', N'This is Q24?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q25', N'This is Q25?', N'Yes', N'No', N'I don''t no', N'OK', N'B', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q26', N'This is Q26?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q27', N'This is Q27?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q28', N'This is Q28?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q29', N'This is Q29?', N'Yes', N'No', N'I don''t no', N'OK', N'D', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q30', N'This is Q30?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q31', N'This is Q31?', N'Yes', N'No', N'I don''t no', N'OK', N'A', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q32', N'This is Q32?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q33', N'This is Q33?', N'Yes', N'No', N'I don''t no', N'OK', N'B', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q34', N'This is Q34?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q35', N'This is Q35?', N'Yes', N'No', N'I don''t no', N'OK', N'A', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q36', N'This is Q36?', N'Yes', N'No', N'I don''t no', N'OK', N'D', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q37', N'This is Q37?', N'Yes', N'No', N'I don''t no', N'OK', N'D', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q38', N'This is Q38?', N'Yes', N'No', N'I don''t no', N'OK', N'D', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q39', N'This is Q39?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q40', N'This is Q40?', N'Yes', N'No', N'I don''t no', N'OK', N'A', CAST(N'2020-05-15' AS Date), N'PRJ321', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q41', N'This is Q41?', N'Yes', N'No', N'I don''t no', N'OK', N'C', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q42', N'This is Q42?', N'Yes', N'No', N'I don''t no', N'OK', N'B', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q43', N'This is Q43?', N'Yes', N'No', N'I don''t no', N'OK', N'B', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q44', N'This is Q44?', N'Yes', N'No', N'I don''t no', N'OK', N'B', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q45', N'This is Q45?', N'Yes', N'No', N'I don''t no', N'OK', N'A', CAST(N'2020-05-15' AS Date), N'DBI202', 1)
INSERT [dbo].[Question] ([id], [question_content], [A1], [A3], [A2], [A4], [answer_correct], [createDate], [subjectID], [statusID]) VALUES (N'Q46', N'This is Q46?', N'OK', N'No', N'Yes', N'Hello', N'D', CAST(N'2020-06-02' AS Date), N'PRJ321', 1)
SET IDENTITY_INSERT [dbo].[Quiz_History] ON 

INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (3, N'DBI202', 1, 1, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (4, N'DBI202', 5, 5, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (5, N'DBI202', 6, 6, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (6, N'DBI202', 7, 7, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (7, N'DBI202', 10, 10, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (8, N'DBI202', 5, 5, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (9, N'DBI202', 1, 1, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (10, N'DBI202', 1, 1, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (11, N'DBI202', 1, 1, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (12, N'DBI202', 1, 1, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (13, N'DBI202', 2, 2, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (14, N'DBI202', 1, 1, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (15, N'DBI202', 1, 1, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (16, N'DBI202', 0, 0, N'hauk13@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (17, N'DBI202', 2, 1, N'hau1402@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (18, N'DBI202', 3, 3, N'hau1402@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (19, N'DBI202', 0, 0, N'hau1402@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (20, N'PRJ321', 1, 1, N'hau1402@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (21, N'DBI202', 2, 2, N'hau1402@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (22, N'DBI202', 0, 0, N'hau1402@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (23, N'DBI202', 2, 2, N'hau1402@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (24, N'DBI202', 0, 0, N'hau1402@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (25, N'DBI202', 1, 1, N'hau1402@gmail.com')
INSERT [dbo].[Quiz_History] ([quizID], [subjectID], [number_correct], [point], [email]) VALUES (26, N'PRJ321', 0, 0, N'hau1402@gmail.com')
SET IDENTITY_INSERT [dbo].[Quiz_History] OFF
INSERT [dbo].[Registration] ([email], [name], [password], [roleID], [statusID]) VALUES (N'hau1400@gmail.com', N'HauNguyen1400', N'9c734f9bfeb12ae306927f173e08086c75ff08000d2618350452f7650cfe771a', 2, 3)
INSERT [dbo].[Registration] ([email], [name], [password], [roleID], [statusID]) VALUES (N'hau1402@gmail.com', N'Hau Nguyenn', N'9c734f9bfeb12ae306927f173e08086c75ff08000d2618350452f7650cfe771a', 2, 1)
INSERT [dbo].[Registration] ([email], [name], [password], [roleID], [statusID]) VALUES (N'hau1403@gmail.com', N'Hau Tran', N'9c734f9bfeb12ae306927f173e08086c75ff08000d2618350452f7650cfe771a', 2, 1)
INSERT [dbo].[Registration] ([email], [name], [password], [roleID], [statusID]) VALUES (N'hau1404@gmail.com', N'Hau Nguyen', N'9c734f9bfeb12ae306927f173e08086c75ff08000d2618350452f7650cfe771a', 1, 1)
INSERT [dbo].[Registration] ([email], [name], [password], [roleID], [statusID]) VALUES (N'hau1407@gmail.com', N'hau1407', N'9c734f9bfeb12ae306927f173e08086c75ff08000d2618350452f7650cfe771a', 2, 1)
INSERT [dbo].[Registration] ([email], [name], [password], [roleID], [statusID]) VALUES (N'hauk13@gmail.com', N'haunguyen', N'9c734f9bfeb12ae306927f173e08086c75ff08000d2618350452f7650cfe771a', 2, 1)
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (2, N'student')
INSERT [dbo].[Status] ([statusID], [statusName]) VALUES (1, N'active')
INSERT [dbo].[Status] ([statusID], [statusName]) VALUES (2, N'deactive')
INSERT [dbo].[Status] ([statusID], [statusName]) VALUES (3, N'new')
INSERT [dbo].[Subject] ([subjectID], [subjectName], [numQuestion], [time]) VALUES (N'DBI202', N'Database', 10, 300)
INSERT [dbo].[Subject] ([subjectID], [subjectName], [numQuestion], [time]) VALUES (N'PRJ321', N'Java Web', 10, 300)
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK__Question__status__44FF419A] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([statusID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK__Question__status__44FF419A]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK__Question__subjec__440B1D61] FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subjectID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK__Question__subjec__440B1D61]
GO
ALTER TABLE [dbo].[Quiz_History]  WITH CHECK ADD  CONSTRAINT [FK__Quiz__subjectID__3D5E1FD2] FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subjectID])
GO
ALTER TABLE [dbo].[Quiz_History] CHECK CONSTRAINT [FK__Quiz__subjectID__3D5E1FD2]
GO
ALTER TABLE [dbo].[Quiz_History]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_History_Registration] FOREIGN KEY([email])
REFERENCES [dbo].[Registration] ([email])
GO
ALTER TABLE [dbo].[Quiz_History] CHECK CONSTRAINT [FK_Quiz_History_Registration]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK__Registrat__roleI__403A8C7D] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK__Registrat__roleI__403A8C7D]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK__Registrat__statu__412EB0B6] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([statusID])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK__Registrat__statu__412EB0B6]
GO
USE [master]
GO
ALTER DATABASE [LAB231_QUIZONLINE] SET  READ_WRITE 
GO
