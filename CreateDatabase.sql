USE [master]
GO
/****** Object:  Database [EnigmatryAssignment]    Script Date: 29.12.2023. 11:25:46 ******/
CREATE DATABASE [EnigmatryAssignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnigmatryAssignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EnigmatryAssignment.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EnigmatryAssignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EnigmatryAssignment_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EnigmatryAssignment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnigmatryAssignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnigmatryAssignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EnigmatryAssignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnigmatryAssignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnigmatryAssignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EnigmatryAssignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnigmatryAssignment] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EnigmatryAssignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EnigmatryAssignment] SET  MULTI_USER 
GO
ALTER DATABASE [EnigmatryAssignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnigmatryAssignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnigmatryAssignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnigmatryAssignment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EnigmatryAssignment] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EnigmatryAssignment]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29.12.2023. 11:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 29.12.2023. 11:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [nvarchar](max) NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[Currency] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 29.12.2023. 11:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[ClientVAT] [nvarchar](max) NOT NULL,
	[RegistrationNumber] [nvarchar](max) NOT NULL,
	[CompanyType] [nvarchar](max) NOT NULL,
	[IsWhitelisted] [bit] NOT NULL,
	[DocumentId] [int] NOT NULL,
	[TenantId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 29.12.2023. 11:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[DocumentId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 29.12.2023. 11:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [nvarchar](max) NOT NULL,
	[IsProductCodeSupported] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 29.12.2023. 11:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants](
	[TenantId] [int] IDENTITY(1,1) NOT NULL,
	[IsWhitelisted] [bit] NOT NULL,
 CONSTRAINT [PK_Tenants] PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 29.12.2023. 11:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [nvarchar](max) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionDate] [datetime2](7) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[TransactionCategory] [nvarchar](max) NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231229095130_InitialMigration', N'6.0.25')
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountId], [AccountNumber], [Balance], [Currency]) VALUES (1, N'95867648', CAST(42331.12 AS Decimal(18, 2)), N'EUR')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientId], [ClientVAT], [RegistrationNumber], [CompanyType], [IsWhitelisted], [DocumentId], [TenantId], [AccountId]) VALUES (2, N'1234', N'123456', N'medium', 1, 1, 1, 1)
INSERT [dbo].[Clients] ([ClientId], [ClientVAT], [RegistrationNumber], [CompanyType], [IsWhitelisted], [DocumentId], [TenantId], [AccountId]) VALUES (4, N'12233', N'654321', N'small', 1, 2, 2, 1)
INSERT [dbo].[Clients] ([ClientId], [ClientVAT], [RegistrationNumber], [CompanyType], [IsWhitelisted], [DocumentId], [TenantId], [AccountId]) VALUES (5, N'334455', N'4455667788', N'large', 0, 3, 3, 1)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Documents] ON 

INSERT [dbo].[Documents] ([DocumentId]) VALUES (1)
INSERT [dbo].[Documents] ([DocumentId]) VALUES (2)
INSERT [dbo].[Documents] ([DocumentId]) VALUES (3)
SET IDENTITY_INSERT [dbo].[Documents] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductCode], [IsProductCodeSupported]) VALUES (1, N'ProductA', 1)
INSERT [dbo].[Products] ([ProductId], [ProductCode], [IsProductCodeSupported]) VALUES (2, N'ProductB', 0)
INSERT [dbo].[Products] ([ProductId], [ProductCode], [IsProductCodeSupported]) VALUES (3, N'ProductC', 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Tenants] ON 

INSERT [dbo].[Tenants] ([TenantId], [IsWhitelisted]) VALUES (1, 1)
INSERT [dbo].[Tenants] ([TenantId], [IsWhitelisted]) VALUES (2, 0)
INSERT [dbo].[Tenants] ([TenantId], [IsWhitelisted]) VALUES (3, 1)
SET IDENTITY_INSERT [dbo].[Tenants] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([Id], [TransactionId], [Amount], [TransactionDate], [Description], [TransactionCategory], [AccountId]) VALUES (3, N'2913', CAST(166.95 AS Decimal(18, 2)), CAST(N'2023-12-29T00:00:00.0000000' AS DateTime2), N'Grocery shopping', N'Food & Dining', 1)
INSERT [dbo].[Transactions] ([Id], [TransactionId], [Amount], [TransactionDate], [Description], [TransactionCategory], [AccountId]) VALUES (6, N'3882', CAST(6.58 AS Decimal(18, 2)), CAST(N'2023-12-29T00:00:00.0000000' AS DateTime2), N'Grocery shopping', N'Food & Dining', 1)
INSERT [dbo].[Transactions] ([Id], [TransactionId], [Amount], [TransactionDate], [Description], [TransactionCategory], [AccountId]) VALUES (7, N'1143', CAST(-241.07 AS Decimal(18, 2)), CAST(N'2023-12-29T00:00:00.0000000' AS DateTime2), N'Gas station purchase"', N'Utilities', 1)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
/****** Object:  Index [IX_Clients_AccountId]    Script Date: 29.12.2023. 11:25:46 ******/
CREATE NONCLUSTERED INDEX [IX_Clients_AccountId] ON [dbo].[Clients]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Clients_DocumentId]    Script Date: 29.12.2023. 11:25:46 ******/
CREATE NONCLUSTERED INDEX [IX_Clients_DocumentId] ON [dbo].[Clients]
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Clients_TenantId]    Script Date: 29.12.2023. 11:25:46 ******/
CREATE NONCLUSTERED INDEX [IX_Clients_TenantId] ON [dbo].[Clients]
(
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_AccountId]    Script Date: 29.12.2023. 11:25:46 ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_AccountId] ON [dbo].[Transactions]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Accounts_AccountId]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Documents_DocumentId] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Documents] ([DocumentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Documents_DocumentId]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Tenants_TenantId] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenants] ([TenantId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Tenants_TenantId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Accounts_AccountId]
GO
USE [master]
GO
ALTER DATABASE [EnigmatryAssignment] SET  READ_WRITE 
GO
