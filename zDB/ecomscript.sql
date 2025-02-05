USE [master]
GO
/****** Object:  Database [BlazorBoot_EcommerceDb]    Script Date: 7/15/2024 3:44:13 PM ******/
CREATE DATABASE [BlazorBoot_EcommerceDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlazorBoot_EcommerceDb', FILENAME = N'E:\MDF_LDF\BlazorBoot_EcommerceDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlazorBoot_EcommerceDb_log', FILENAME = N'E:\MDF_LDF\BlazorBoot_EcommerceDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlazorBoot_EcommerceDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET RECOVERY FULL 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET  MULTI_USER 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BlazorBoot_EcommerceDb', N'ON'
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET QUERY_STORE = OFF
GO
USE [BlazorBoot_EcommerceDb]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/15/2024 3:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ShopFavorites] [bit] NOT NULL,
	[CustomerFavorites] [bit] NOT NULL,
	[Color] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_CategoryProduct]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CategoryProduct]
AS
SELECT dbo.Categories.Name AS CategoryName, dbo.Products.Name AS ProductName, REPLACE(REPLACE(dbo.Products.Description, '<p>', ''), '</p>', '') AS Description, dbo.Products.Color, dbo.Products.Id, dbo.Categories.CreateDate
FROM     dbo.Categories INNER JOIN
                  dbo.Products ON dbo.Categories.Id = dbo.Products.CategoryId
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/15/2024 3:44:14 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderHeaderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Size] [nvarchar](max) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeaders]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeaders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[OrderTotal] [float] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShippingDate] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[SessionId] [nvarchar](max) NULL,
	[PaymentIntentId] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[StreetAddress] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Carrier] [nvarchar](max) NULL,
	[Tracking] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderHeaders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrices]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPrices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Size] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_ProductPrices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tepm_DelInfo_Cat_Prod]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tepm_DelInfo_Cat_Prod](
	[CategoryId] [int] NULL,
	[CategoryName] [varchar](50) NULL,
	[ProductId] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[ProductPriceId] [int] NULL,
	[ProductPrice] [float] NULL,
	[UserId] [varchar](100) NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestCharacters]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestCharacters](
	[CharId] [int] IDENTITY(1,1) NOT NULL,
	[CharName] [varchar](50) NULL,
	[HitPoints] [varchar](50) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_TestCharacters] PRIMARY KEY CLUSTERED 
(
	[CharId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestUsers]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestUsers](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
 CONSTRAINT [PK_TestUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230709065915_AddCategoryToDatabase', N'7.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230819104015_AddProductToDB', N'7.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230830101108_addProductPriceToDb', N'7.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231018114255_AddOrderHeaderDetailsAndIdentityTables', N'7.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231019045523_AddNameToAspNetUser', N'7.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231123062141_addCarrierAndTrackingToOderHeader', N'7.0.12')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3aeafeb1-8ab4-4432-8057-480a83290214', N'Customer', N'CUSTOMER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'85e9bf70-65a6-480a-b057-e0007700f044', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'04891ef5-e9a0-4b83-95fe-5d665bcb40ab', N'3aeafeb1-8ab4-4432-8057-480a83290214')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'19a8451b-7622-4342-af20-3cae8fd96ce2', N'3aeafeb1-8ab4-4432-8057-480a83290214')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', N'3aeafeb1-8ab4-4432-8057-480a83290214')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'47eba509-0bc5-477c-9fc2-91f5045e8bde', N'3aeafeb1-8ab4-4432-8057-480a83290214')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4fb96c8e-0456-4052-839e-d340c12d29ba', N'3aeafeb1-8ab4-4432-8057-480a83290214')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'aba41270-4c21-45e5-8fa1-62857f78f7ca', N'3aeafeb1-8ab4-4432-8057-480a83290214')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ccaf0f00-8cd9-4096-a4f1-d7dc5a90d32e', N'3aeafeb1-8ab4-4432-8057-480a83290214')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', N'3aeafeb1-8ab4-4432-8057-480a83290214')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f3538df8-6be9-476c-9653-59b3c2a77ddd', N'3aeafeb1-8ab4-4432-8057-480a83290214')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'54004c5c-cf0e-44b0-ba0f-4875096fc857', N'85e9bf70-65a6-480a-b057-e0007700f044')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'04891ef5-e9a0-4b83-95fe-5d665bcb40ab', N'moynul@gmail.com', N'MOYNUL@GMAIL.COM', N'moynul@gmail.com', N'MOYNUL@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAELJ1zyLOXlYAAmAYd9TJFlxf+ce5fPBwr7AwI65GC7BH9RcPpQ2Usvw+MsuOUPs1Gw==', N'2QOJO4BOQTSP6DO2I25HVRJPYCMEOQHN', N'0015e691-cc9a-4cb0-887c-64a9065f6895', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'19a8451b-7622-4342-af20-3cae8fd96ce2', N'email2jahangir@gmail.com', N'EMAIL2JAHANGIR@GMAIL.COM', N'email2jahangir@gmail.com', N'EMAIL2JAHANGIR@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJM92RTW9aKNsi3i19WswZRTB9w52/FGE0e2PMG2Fk7MUcTecizkIY2KUEZT69cdsw==', N'C2LDWYNX4XXJMHV64L2UYQFLF3RFS75S', N'3fe49422-79df-495c-af43-5842d747b505', N'2343', 0, 0, NULL, 1, 0, N'ApplicationUser', N'email2jahangir@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', N'rasifstrawberry98@gmail.com', N'RASIFSTRAWBERRY98@GMAIL.COM', N'rasifstrawberry98@gmail.com', N'RASIFSTRAWBERRY98@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEEcnZdNiJS0adVpXyKC+/9cMrzSbvo3+AkUcFT988i2cHj9aKDwsNsXOAbw7Mdl56A==', N'SNUSR5XZLHB2NQTOZID25HCBNN32PDRS', N'a40ccdf6-7f2f-4b72-bcb7-a505f600add7', N'3423', 0, 0, NULL, 1, 0, N'ApplicationUser', N'rasifstrawberry98@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'47eba509-0bc5-477c-9fc2-91f5045e8bde', N'test2@gmail.com', N'TEST2@GMAIL.COM', N'test2@gmail.com', N'TEST2@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJGgCLJxVP5h9si9kNckhNuT/o8vO7K4P7WrTb/2Pq7dBE6H4BJdJ8Dmg9QORwHxsg==', N'3R3VT35OPSFRNI44IL5VIEMDVE37CLEX', N'768e3ec6-cfc2-4854-b0f3-43eb32621371', N'7879', 0, 0, NULL, 1, 0, N'ApplicationUser', N'test2@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'4fb96c8e-0456-4052-839e-d340c12d29ba', N'rasifrasifkhan1971@gmail.com', N'RASIFRASIFKHAN1971@GMAIL.COM', N'rasifrasifkhan1971@gmail.com', N'RASIFRASIFKHAN1971@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEKlckhS40pfuPES9AqwQAlKst7irGf8DdMXZT+aXXXkzmfg7m7Dp1PYlNvpew1sjTA==', N'A3XZIZ4JDS7RGBROVLFQOIFBYNHO57F4', N'5c1cb281-1223-4393-8318-29a4c5f28fa4', N'4535', 0, 0, NULL, 1, 0, N'ApplicationUser', N'rasifrasifkhan1971@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'54004c5c-cf0e-44b0-ba0f-4875096fc857', N'ecommerceasiantech@gmail.com', N'ECOMMERCEASIANTECH@GMAIL.COM', N'ecommerceasiantech@gmail.com', N'ECOMMERCEASIANTECH@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAECNHHKbTht7jAT/kpzi3eWNErubHbDFmMPvIrdu+2mqY1Y9BkDL/GYD9FatpG4SDhQ==', N'HQIIQIKEFGMLR3Q2EEQ5PZQ5JFFET6WP', N'5f279a2c-e2b2-4612-8b7a-876edab6b274', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'aba41270-4c21-45e5-8fa1-62857f78f7ca', N'test@gmail.com', N'TEST@GMAIL.COM', N'test@gmail.com', N'TEST@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEAyWTN33AUcdS12I+vlAohwF2XHRJ//dRe1emtXaktHoKzjgZbpUnQqYKqaGUlM/GQ==', N'E5XBAZ775CR7CDB426L7YSCPUJY6WPBD', N'66c0a823-99fd-4a2d-a997-5b3557d2f24e', N'34737', 0, 0, NULL, 1, 0, N'ApplicationUser', N'test1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'ccaf0f00-8cd9-4096-a4f1-d7dc5a90d32e', N'netzerotest@gmail.com', N'NETZEROTEST@GMAIL.COM', N'netzerotest@gmail.com', N'NETZEROTEST@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGzH/ZQgQou60VwW9GXPibE4Aj/1xRcGKRs15IdLB6UGP/WPULS3+oyE0RX0Qld+FA==', N'YQYN773M7XZDWQ7KGH3XY3UER6UHC3MZ', N'94c1aa4a-1084-4534-8ff6-cebcca362b83', NULL, 0, 0, NULL, 1, 0, N'IdentityUser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', N'rasifkhanrasu@gmail.com', N'RASIFKHANRASU@GMAIL.COM', N'rasifkhanrasu@gmail.com', N'RASIFKHANRASU@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJvDIvaIb9dWns4LfrlFnQ59RJXwEBGXRur1kfrr2XAYgc6HMB8HUqdnoVeYWpfZ9w==', N'FFCMEFO6DKCWK5DLJK25MVAJHQXR4JQT', N'12cba02c-fd02-45c4-8dc0-f964145f3d59', N'3243', 0, 0, NULL, 1, 0, N'ApplicationUser', N'rasifkhanrasu@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [Name]) VALUES (N'f3538df8-6be9-476c-9653-59b3c2a77ddd', N'joychakraborty121@gmail.com', N'JOYCHAKRABORTY121@GMAIL.COM', N'joychakraborty121@gmail.com', N'JOYCHAKRABORTY121@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEPyU9zK5tSRoKYqhHR2Pa8psXsPs8IHRj/71oqxNbwYauk+eNXnO/2M9FIIJKL6dKQ==', N'AMRQ273FACBZZBY534CGBHDL2QY44YLM', N'7174296d-160f-4cd5-8b1b-47b19e5cb384', N'36423864', 0, 0, NULL, 1, 0, N'ApplicationUser', N'joychakraborty121@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreateDate]) VALUES (1, N'Cake', CAST(N'2023-11-29T15:57:34.7419366' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreateDate]) VALUES (2, N'Sports Tools', CAST(N'2023-11-29T16:02:45.3135930' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreateDate]) VALUES (2004, N'Sea Food', CAST(N'2023-12-28T13:06:37.7462695' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreateDate]) VALUES (2006, N'Watchs', CAST(N'2023-12-31T09:57:28.8276207' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreateDate]) VALUES (2013, N'Drinks', CAST(N'2024-01-03T16:23:51.8118278' AS DateTime2))
INSERT [dbo].[Categories] ([Id], [Name], [CreateDate]) VALUES (2018, N'Mobile', CAST(N'2024-01-11T12:50:20.5587341' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1, 1, 1, 2, 20, N'Medium', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (2, 1, 2, 2, 70, N'Medium', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (3, 2, 1, 2, 20, N'Medium', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (4, 2, 2, 2, 70, N'Medium', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (5, 3, 1, 5, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (6, 4, 1, 2, 15, N'Small', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (7, 4, 2, 2, 100, N'Large', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (8, 5, 1, 1, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (9, 6, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (10, 7, 1, 2, 15, N'Small', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (11, 7, 2, 2, 100, N'Large', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (12, 8, 1, 2, 15, N'Small', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (13, 8, 2, 2, 100, N'Large', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1002, 1002, 1, 1, 15, N'Small', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1003, 1003, 1, 1, 15, N'Small', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1004, 1004, 1, 1, 15, N'Small', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1005, 1004, 1, 1, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1006, 1005, 1, 1, 15, N'Small', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1007, 1005, 1, 1, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1008, 1006, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1009, 1007, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1010, 1008, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1011, 1009, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1012, 1010, 1, 1, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1013, 1011, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1014, 1012, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1015, 1013, 1, 1, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1016, 1014, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1017, 1015, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1018, 1016, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1019, 1017, 1, 2, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1020, 1018, 1, 1, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1021, 1019, 1, 1, 30, N'Large', N'BirthDay Cake')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1022, 1020, 2, 1, 100, N'Large', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1023, 1021, 2, 1, 70, N'Medium', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1024, 1022, 2, 1, 70, N'Medium', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1025, 1023, 2, 1, 70, N'Medium', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1026, 1024, 2, 5, 100, N'Large', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1027, 1025, 2, 2, 70, N'Medium', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1028, 1026, 2, 1, 70, N'Medium', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1029, 1027, 1002, 2, 8, N'Medium', N'Cream Biscuit')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1030, 1027, 2, 1, 70, N'Medium', N'SuperFast Sk Board')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1031, 1028, 1003, 1, 20, N'Large', N'Scarlet CK-11')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1032, 1029, 1003, 1, 13, N'Small', N'Scarlet CK-11')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1033, 1030, 1003, 2, 20, N'Large', N'Scarlet CK-11')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1034, 1031, 1003, 2, 20, N'Large', N'Scarlet CK-11')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1035, 1032, 1003, 5, 16, N'Medium', N'Scarlet CK-11')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1036, 1033, 1003, 2, 20, N'Large', N'Scarlet CK-11')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1037, 1033, 1003, 1, 13, N'Small', N'Scarlet CK-11')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (1038, 1034, 1003, 1, 20, N'Large', N'Scarlet CK-11')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (2031, 2028, 2006, 1, 34, N'8oz', N'dfsdf')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (2032, 2029, 2006, 3, 12, N'Medium', N'dfsdf')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (3032, 3029, 2011, 2, 100, N'Medium', N'Titan 202')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (3033, 3030, 2011, 3, 120, N'Large', N'Titan 202')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (3034, 3031, 2011, 1, 120, N'Large', N'Titan 202')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (3035, 3031, 2006, 1, 34, N'8oz', N'dfsdf')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (3036, 3032, 2029, 2, 232, N'Medium', N'rrtr')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (3037, 3032, 2011, 2, 120, N'Large', N'Titan 202')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (4034, 4031, 2006, 3, 12, N'Medium', N'Cocacole')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (5034, 5031, 2006, 1, 12, N'Medium', N'Cocacole')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (5035, 5031, 2012, 1, 130, N'Large', N'Casio 45')
INSERT [dbo].[OrderDetails] ([Id], [OrderHeaderId], [ProductId], [Count], [Price], [Size], [ProductName]) VALUES (6034, 6031, 2011, 1, 120, N'Large', N'Titan 202')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderHeaders] ON 

INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1, N'47eba509-0bc5-477c-9fc2-91f5045e8bde', 180, CAST(N'2023-11-29T16:10:13.9544788' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Shipped', N'cs_test_b1P8YKwkftJBHF1lMIjEGY6waPbYJnFNLaESTWagDCBGr6Z4gDtxjDI6jC', N'pi_3OHkifH3TLQLEjzL1yj6L4we', N'test2@gmail.com', N'7879', N't', N't', N't', N'40004', N'test2@gmail.com', N'df', N'fd')
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (2, N'4fb96c8e-0456-4052-839e-d340c12d29ba', 180, CAST(N'2023-11-29T16:19:45.1990248' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_b1R5lSDS6sgvouUMj2pwqiomQmzDvpPVBpTJzSshiUxwxlxz2DIEF3Wzpu', N'pi_3OHkrtH3TLQLEjzL1BNpfqxw', N'rasifrasifkhan1971@gmail.com', N'4535', N'sffs', N'sd', N'sdf', N'4000', N'rasifrasifkhan1971@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (3, N'4fb96c8e-0456-4052-839e-d340c12d29ba', 150, CAST(N'2023-11-29T16:27:22.6095455' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1qc5fID3g236GCGB5y7n7xIKzCIzHFWxWT335Ukfgdg3eMZV5mi2h0iAg', N'pi_3OHkzGH3TLQLEjzL1t47j1Xg', N'rasifrasifkhan1971@gmail.com', N'4535', N'dffsd', N'sdfs', N'sdfs', N'3434', N'rasifrasifkhan1971@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (4, N'4fb96c8e-0456-4052-839e-d340c12d29ba', 230, CAST(N'2023-11-29T16:48:49.4183630' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_b10P8Ec9nytnrtZ2W8Blk5xBFvRTyMqcOQ8tuM7h6a3PbiZgLGqGgg6rFL', N'pi_3OHlK1H3TLQLEjzL07hfUqWw', N'rasifrasifkhan1971@gmail.com', N'4535', N'dsf', N'fd', N'sfs', N'3332342', N'rasifrasifkhan1971@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (5, N'4fb96c8e-0456-4052-839e-d340c12d29ba', 30, CAST(N'2023-11-29T16:57:02.6458771' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1e7NRtOt3b6BIckriSVqhwlaAjVzn0RqyzgiOZLidhg2OVhbZFnlJHEuH', N'pi_3OHlRyH3TLQLEjzL1zwC0xOU', N'rasifrasifkhan1971@gmail.com', N'4535', N'sf', N'dfs', N'fd', N'2324', N'rasifrasifkhan1971@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (6, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-29T17:02:46.3881261' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1SIziGOCqiSrev5bu1wwhUdXG5j7zVf3x9QKYUKGcPjQzQY5O8geRUbTH', N'pi_3OHlXWH3TLQLEjzL17IanFml', N'rasifkhanrasu@gmail.com', N'3243', N'y', N'y', N'y', N'53534w', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (7, N'4fb96c8e-0456-4052-839e-d340c12d29ba', 230, CAST(N'2023-11-29T17:31:58.5058145' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_b16NfWiMbV6VetZmBVXdF14YjakRjJtYZUm03RKKtyGue5bE17qh9HTRr2', N'pi_3OHlzmH3TLQLEjzL19FUZX19', N'rasifrasifkhan1971@gmail.com', N'4535', N'fsds', N'dfd', N'dfsd', N'43242', N'rasifrasifkhan1971@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (8, N'4fb96c8e-0456-4052-839e-d340c12d29ba', 230, CAST(N'2023-11-29T17:36:16.1543773' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_b1dik3SvZwwxfPxmKfwRbc9yac0rAJIR1lFZNvIdLLLmpyG0GtqGcxK6kb', N'pi_3OHm3wH3TLQLEjzL1x4oZEHB', N'rasifrasifkhan1971@gmail.com', N'4535', N'dfs', N'sd', N'sd', N'3423', N'rasifrasifkhan1971@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1002, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 15, CAST(N'2023-11-30T09:43:05.1517606' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1NqSOUkmGyZ3VzJ6RiX0aypXX6C8egcv8DiTeuzBLckp22DZJXyY3e1cz', N'pi_3OI19ZH3TLQLEjzL1iJW0HGh', N'rasifkhanrasu@gmail.com', N'3243', N'fsdkhf', N'JKJ', N'llj', N'53938', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1003, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 15, CAST(N'2023-11-30T10:15:27.9762581' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1sMWDRt75kcRw8kUXbzhyk40gLHcDZ8Sz5dk1UkANjssnF76ddMPUyFSP', N'pi_3OI1euH3TLQLEjzL0PLXK2gN', N'rasifkhanrasu@gmail.com', N'3243', N'dfsdf', N'sdf', N'sdf', N'4324', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1004, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 45, CAST(N'2023-11-30T10:36:41.8591298' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Shipped', N'cs_test_b1XSfUBd1eWiMD1uUtIH3jniSG6BWJ1rUHlY6qGEU1e9qQFg5wywGtjeij', N'pi_3OI1zSH3TLQLEjzL0P7MgKxL', N'rasifkhanrasu@gmail.com', N'3243', N'dfsdf', N'fsd', N'wee', N'44334', N'rasifkhanrasu@gmail.com', N'fsdfs', N'sdfdfs')
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1005, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 45, CAST(N'2023-11-30T10:38:38.5445387' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_b1mgdg9LHZlSFclQyoKYairmkJrmpywi9C4a6HYywvjxIflKrbO9sf5tvT', N'pi_3OI21KH3TLQLEjzL0r1PGhKO', N'rasifkhanrasu@gmail.com', N'3243', N'dfsd', N'sdf', N'sdfs', N'2423', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1006, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-30T12:01:02.0037464' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1ZG7hvInIg8XOYpvDmxvM4IFZeHeHTJ5EdrvFSabZP2WjxDTJEharf8k5', N'pi_3OI3J3H3TLQLEjzL1G9LFftw', N'rasifkhanrasu@gmail.com', N'3243', N'fsd', N'sdf', N'sdf', N'234', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1007, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-30T12:20:32.7207339' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1mNlXzp7dBwmGPIpEzUCJCf0IsfnRvqVvqtrMOIhZFM5vsADvxiA5k2uc', N'pi_3OI3bwH3TLQLEjzL1tWnvekw', N'rasifkhanrasu@gmail.com', N'3243', N'fds', N'df', N'sfd', N'3423', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1008, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-30T12:31:09.9031882' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a16Iyc7BjFBLTseQQR7anDsBb02H9IAK09bapqSnoPiz182qzp66GfOn5u', N'pi_3OI3mDH3TLQLEjzL04JzfC0t', N'rasifkhanrasu@gmail.com', N'3243', N'sdfsd', N'sdf', N'sdf', N'4324242', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1009, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-30T12:47:39.9774044' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1x326A7qfP6chfId7iPMvYeh48w46zxqe0Xfjq69y1K09sUTL9rFQvbZo', N'pi_3OI42BH3TLQLEjzL1D8UotSS', N'rasifkhanrasu@gmail.com', N'3243', N'dfsd', N'dfsd', N'fsdf', N'4343', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1010, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 30, CAST(N'2023-11-30T13:39:10.7145305' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1B3WtIHKjgSbfmbmG0dWPOTCEVqzt9OM4eojvCOkDfMGp4s0WTQyhtuau', N'pi_3OI4q3H3TLQLEjzL12DdfNSc', N'rasifkhanrasu@gmail.com', N'3243', N'sdf', N'sdf', N'fsd', N'342343', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1011, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-30T14:03:17.8616993' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1Sm4pi02D1UXm88zhwXzT8C6PycNH1WZ91UfmZnXoXlDK8MRU4Jlxipqc', N'pi_3OI5DOH3TLQLEjzL1Lend81Z', N'rasifkhanrasu@gmail.com', N'3243', N'dssdf', N'fsdf', N'dfs', N'42342', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1012, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-30T14:08:31.5047905' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a16TUaq1bdBgdfH8CKQkqeFkbwcljS7TiFa2rQIhOKGqHDipneluo7ju1n', N'pi_3OI5IRH3TLQLEjzL12yIndwV', N'rasifkhanrasu@gmail.com', N'3243', N'fsdfs', N'fs', N'fsdf', N'23434', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1013, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 30, CAST(N'2023-11-30T14:13:53.8267363' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1YMTWloboVazgAkJUEkKEBLkJfiL4fuiaZ3xrViHkHyHEkWB4J9KbIfEl', N'pi_3OI5NeH3TLQLEjzL04SQoMGk', N'rasifkhanrasu@gmail.com', N'3243', N'sdf', N'fsdf', N'f', N'34234', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1014, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-30T14:17:47.7568864' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1DnmVb3wqLC3WFiAdmLzCycK6J7WtoSvLgVHt3xIhy2rnoeFnH2JODSdQ', N'pi_3OI5RQH3TLQLEjzL1uEI9sP6', N'rasifkhanrasu@gmail.com', N'3243', N'fs', N's', N's', N'3434', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1015, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-30T14:20:48.1203175' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1LFSYIvjSFWz0wzI1MhwB6fimcrgSlSdnAI52DtLdgBdkMP3ozF4I3aJU', N'pi_3OI5UKH3TLQLEjzL0lKCj0O4', N'rasifkhanrasu@gmail.com', N'3243', N'dfsd', N'sdf', N'fsdf', N'3432', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1016, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-30T14:44:19.6100569' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1fP9Yda6RP2T9qgEOvupyc06B7BFmP1wLiz9qcbghqFYkzz1l6J4OHCiZ', N'pi_3OI5r5H3TLQLEjzL1YGGLt0j', N'rasifkhanrasu@gmail.com', N'3243', N'sdfd', N'fsf', N'fsf', N'3434', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1017, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 60, CAST(N'2023-11-30T15:18:39.1802280' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1GvYE7ln3SBirtTKK2k2nu2iksjfcTXGKQTnZrBAETQhVX4RTU4wdx1YQ', N'pi_3OI6OJH3TLQLEjzL0XYdc8Ix', N'rasifkhanrasu@gmail.com', N'3243', N'sdf', N'fsdfs', N'fsdfs', N'34234', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1018, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 30, CAST(N'2023-11-30T15:25:04.6328690' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1zz0SiHAJdOwy7bYmeur5KBnJiOSEqvZadFsS23g40YYQ47HN8owCYIvJ', N'pi_3OI6UWH3TLQLEjzL1YmCwMXk', N'rasifkhanrasu@gmail.com', N'3243', N'f', N'g', N'fgd', N'423', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1019, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 30, CAST(N'2023-11-30T15:30:03.3392876' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1CeCbmeqJDTkFpk7PLmaebWX2McVPzuC7VHxBVgBHrPb0EAWrAMnJbv7U', N'pi_3OI6ZLH3TLQLEjzL1SuCCHhg', N'rasifkhanrasu@gmail.com', N'3243', N'dffd', N'df', N'fdfd', N'234242', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1020, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 100, CAST(N'2023-11-30T15:36:28.6090739' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1yAiUcHhKIRtX65aFzt2cjSLAnyZ3qPSXqjboq04yig2FLYtZJZxIixbK', N'pi_3OI6fYH3TLQLEjzL1y5voTwE', N'rasifstrawberry98@gmail.com', N'3423', N'dfs', N'sdf', N'sdf', N'3423', N'rasifstrawberry98@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1021, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 70, CAST(N'2023-11-30T16:02:08.3166739' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Pending', N'cs_test_a1KpJzYDbMn8005enrw8etfNPdWTNuBagqDHEK4z4gu8AB1hAoLJEgXl7n', N'pi_3OI74OH3TLQLEjzL0nKi1AmV', N'rasifstrawberry98@gmail.com', N'3423', N'dfsdf', N'sdf', N'sdfsdf', N'3424', N'rasifstrawberry98@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1022, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 70, CAST(N'2023-11-30T16:02:59.0345577' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1JxSGf8ajZLzUe1pwXex6GjGAsH7mfNYP94kgBV2SIaTNboSA4cWnPwGy', N'pi_3OI75DH3TLQLEjzL05v6ZiVs', N'rasifstrawberry98@gmail.com', N'3423', N'dfs', N'sdf', N'sdfs', N'4233', N'rasifstrawberry98@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1023, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 70, CAST(N'2023-11-30T16:05:01.8361860' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1W3YB4DnAfTv9lJwC3fidl9llfig5zUKxuKQSag2fAHt6TGsb5OVC7RwK', N'pi_3OI77CH3TLQLEjzL0j6y4n3j', N'rasifstrawberry98@gmail.com', N'3423', N'dsfsd', N'sdfds', N'sf', N'3423', N'rasifstrawberry98@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1024, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 500, CAST(N'2023-11-30T16:10:26.4428899' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1PiWJMataUV0ef9od6g5QOBo1ZD2pIUFCtkc7eYEwBIdWD060Ea5wG4tp', N'pi_3OI7CQH3TLQLEjzL0FB3ENFH', N'rasifstrawberry98@gmail.com', N'3423', N'fsdf', N'dfs', N'sfs', N'3424', N'rasifstrawberry98@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1025, N'f3538df8-6be9-476c-9653-59b3c2a77ddd', 140, CAST(N'2023-11-30T16:17:00.9368320' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a16ImpUshRFWEybltz9urUyYXPb45ZhqLs8KjWWlCnSiaSXwRnMquouCLY', N'pi_3OI7InH3TLQLEjzL17dx7tXp', N'joychakraborty121@gmail.com', N'36423864', N'fdsa', N'sdfasd34234', N'asdfas', N'234234', N'joychakraborty121@gmail.com', N'NULL', N'NULL')
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1026, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 70, CAST(N'2023-11-30T17:38:28.0523800' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1NYJ90tl7BLqja3YwvebS5RsjJnlzKQuXE2uHdV4NzDoEjq0nZhn4M5gP', N'pi_3OI8ZcH3TLQLEjzL0g0ni68R', N'rasifstrawberry98@gmail.com', N'3423', N'sdsa', N'd32a', N'sadd', N'23232', N'rasifstrawberry98@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1027, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 86, CAST(N'2023-12-02T15:07:42.7644470' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Shipped', N'cs_test_b1Z7t57CwtOZvUtJKfF2Ra2ksOg7Eymd2aU2LOVWYnPoJuSBzN1xNmhDcg', N'pi_3OIpApH3TLQLEjzL06ULIAeV', N'rasifstrawberry98@gmail.com', N'3423', N'sdf', N'sdfs', N'fsfs', N'423423', N'rasifstrawberry98@gmail.com', N'dfsd', N'sdfs')
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1028, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 20, CAST(N'2023-12-03T14:36:19.3571651' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Shipped', N'cs_test_a1oZWp8q7BhAwPqWpZR24kuzhzNQueKwQuhLdo2hj1ErW3JuJ2AdIXhoKM', N'pi_3OJBA0H3TLQLEjzL0xguWWN3', N'rasifkhanrasu@gmail.com', N'3243', N'YY', N'YY', N'YY', N'34827', N'rasifkhanrasu@gmail.com', N'jjj', N'kkk')
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1029, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 13, CAST(N'2023-12-04T10:21:48.9421313' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Shipped', N'cs_test_a1j5UPmDaLzwsqsKUQvI9vbiLs9vaQiDRArRAjAQmRptob9Fb6F8kT9fBl', N'pi_3OJTfFH3TLQLEjzL1sxsh4Qp', N'rasifkhanrasu@gmail.com', N'3243', N'sdfs', N'sdf', N'dfs', N'3213', N'rasifkhanrasu@gmail.com', N'KB-3535', N'4567')
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1030, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 40, CAST(N'2023-12-04T10:43:04.2475675' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Pending', N'cs_test_a16k3xnp6LWqn8EUpKNE6wDKOiXtXK3M95yBEdu98PYTuZ10RWVEwYPFpY', N'pi_3OJTzoH3TLQLEjzL0jXOK6RG', N'rasifstrawberry98@gmail.com', N'3423', N'djkfsdf', N'kjhjkh', N'qhejkh', N'236742`', N'rasifstrawberry98@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1031, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 40, CAST(N'2023-12-04T10:44:05.2876572' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1YylThO9ihxUauATP3b2dv2HNqMwX0miiseZsrrqvPhzFnUAtChjJKXOp', N'pi_3OJU0oH3TLQLEjzL1oi9IHt8', N'rasifstrawberry98@gmail.com', N'3423', N'sdfs', N'sdf', N'sfsd', N'23423', N'rasifstrawberry98@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1032, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 80, CAST(N'2023-12-04T14:29:52.2381217' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Shipped', N'cs_test_a1DazasmecCEz5W6sMMssustZYOBCydJKbfUaAolNyQnEKu2dtw6E0L34j', N'pi_3OJXXIH3TLQLEjzL1gaaHG8h', N'rasifkhanrasu@gmail.com', N'3243', N'snow', N'snow', N'snow', N'4342', N'rasifkhanrasu@gmail.com', N'sksk', N'sdfjd')
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1033, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 53, CAST(N'2023-12-05T12:57:21.4900124' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_b1CM6EuHuFm6fFVZFBB8poh7tWqPCjS3vmekJqnSXAs94UYJlKTrjtPwGo', N'pi_3OJsZKH3TLQLEjzL1PnhNZJY', N'rasifstrawberry98@gmail.com', N'3423', N'dfs', N'sdfs', N'sdfs', N'2342', N'rasifstrawberry98@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (1034, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 20, CAST(N'2023-12-06T17:54:25.6733068' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1GHFhs4Ki3XX2376h3377Jrql9FxfsJpT2YzAArhkuqggfxw7PSzYK1jW', N'pi_3OKJgMH3TLQLEjzL0pYbQTNo', N'rasifkhanrasu@gmail.com', N'3243', N'sdjfj', N'lkj', N'kqjlj', N'42378', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (2028, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 34, CAST(N'2023-12-13T17:12:02.3363365' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1kICW7Ca7z13aPRgKpaNQordvJGiLabQl1HVRQvVen4AtsOGqwTPtbUaN', N'pi_3OMqM9H3TLQLEjzL0koK1ZpF', N'rasifkhanrasu@gmail.com', N'3243', N'sdf', N'fsdf', N'sfd', N'sdfsd', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (2029, N'f3538df8-6be9-476c-9653-59b3c2a77ddd', 36, CAST(N'2023-12-25T17:22:04.2796670' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1kIAUtb68MLQSNyD0bNWDSEYIeSY9nDql7IDc7NVAzL4OfLtp4zKUKVbb', N'pi_3ORCESH3TLQLEjzL1trp2GsG', N'joychakraborty121@gmail.com', N'36423864', N'sdfs', N'sdf', N'sdfsd', N'4534', N'joychakraborty121@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (3029, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 200, CAST(N'2023-12-31T10:05:28.3682114' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Shipped', N'cs_test_a1qCrMOWsYJLkChfnQJGo1hvupzKlTJugNxRoCHRixcSCIN8QrClXt4Joe', N'pi_3OTGHEH3TLQLEjzL1xaxgGCN', N'rasifstrawberry98@gmail.com', N'3423', N'jjjj', N'ctg', N'ctg', N'4000', N'rasifstrawberry98@gmail.com', N'ggggg', N'gggggg')
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (3030, N'3166b875-25aa-45bf-b02c-18ee73cdbb6f', 360, CAST(N'2023-12-31T10:09:23.6955338' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_a1rxMfzyQRg8TjHwLL3JHn3LMBAXndq2dEWxQzy1BpyiRoGlvs8HYPo3ad', N'pi_3OTGL1H3TLQLEjzL0qIXgTDC', N'rasifstrawberry98@gmail.com', N'3423', N'ttttt', N'yyyyy', N'eeeee', N'44444', N'rasifstrawberry98@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (3031, N'f3538df8-6be9-476c-9653-59b3c2a77ddd', 154, CAST(N'2024-01-11T12:42:23.5493219' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_b12UyA6VncwThXWxxYkdZ9Nc683P8yLUj8cYd0y1leUrHEAaT42G49HldV', N'pi_3OXHy6H3TLQLEjzL1wunOsyV', N'joychakraborty121@gmail.com', N'36423864', N'dfjks', N'hhjkhjk', N'hjkashdjk', N'hjkhjk', N'joychakraborty121@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (3032, N'19a8451b-7622-4342-af20-3cae8fd96ce2', 704, CAST(N'2024-01-11T13:27:07.8503087' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Refunded', N'cs_test_b1h1n4pgdObm51rSsCO3rd1mwWerCX5Lk7G9DihZyTtAVD5hZAfA4rksHb', N'pi_3OXIfPH3TLQLEjzL0yWf6iac', N'email2jahangir@gmail.com', N'2343', N'gguyg', N'uut', N'yut', N'4444', N'email2jahangir@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (4031, N'df15e7b1-47cb-46f2-aa1b-5c5b195cd44e', 36, CAST(N'2024-01-25T10:18:12.7050529' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1e6fz5Xf1EhGbumbRrsh8xjMxVGGwW3Zfq9KQZaScWeTA7uCmqr47EY83', N'pi_3OcKOGH3TLQLEjzL0dvZ7xAu', N'rasifkhanrasu@gmail.com', N'3243', N'sdfsd', N'sddd', N'sd', N'3434', N'rasifkhanrasu@gmail.com', NULL, NULL)
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (5031, N'f3538df8-6be9-476c-9653-59b3c2a77ddd', 142, CAST(N'2024-07-02T16:32:25.8368772' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Shipped', N'cs_test_b1RD4HICTOwMGlQCn7KhgUPQtrfWq0hZfxIBosmZUH5J9sk0IiackGg6Fz', N'pi_3PY40cH3TLQLEjzL1Mq7c24E', N'joychakraborty121@gmail.com', N'36423864', N'f', N'f', N'ff', N'4000', N'joychakraborty121@gmail.com', N'Yes', N'Yes')
INSERT [dbo].[OrderHeaders] ([Id], [UserId], [OrderTotal], [OrderDate], [ShippingDate], [Status], [SessionId], [PaymentIntentId], [Name], [PhoneNumber], [StreetAddress], [State], [City], [PostalCode], [Email], [Carrier], [Tracking]) VALUES (6031, N'f3538df8-6be9-476c-9653-59b3c2a77ddd', 120, CAST(N'2024-07-10T17:55:59.0284578' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Confirmed', N'cs_test_a1YXTGwXxHapRRam4rSY6zdRO859WB3MEIjGvz1vsPQ5pnWqEmFaYv8GKU', N'pi_3Paz7qH3TLQLEjzL0McpjjjT', N'joychakraborty121@gmail.com', N'36423864', N'sjkfjksdlk', N'fsdf', N'fsdfsdfs', N'3434343', N'joychakraborty121@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderHeaders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPrices] ON 

INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (2005, 2006, N'Medium', 12)
INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (2006, 2006, N'8oz', 34)
INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (2007, 2011, N'Medium', 100)
INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (2008, 2011, N'Large', 120)
INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (2009, 2012, N'Small', 90)
INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (2010, 2012, N'Large', 130)
INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (3029, 4023, N'Small', 2)
INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (3030, 4023, N'Medium', 5)
INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (3031, 4023, N'Large', 10)
INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (3032, 2006, N'Large', 40)
INSERT [dbo].[ProductPrices] ([Id], [ProductId], [Size], [Price]) VALUES (3033, 2006, N'Small', 55)
SET IDENTITY_INSERT [dbo].[ProductPrices] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [ShopFavorites], [CustomerFavorites], [Color], [ImageUrl], [CategoryId]) VALUES (2006, N'Cocacole', N'<p><span style="color: rgb(26, 26, 26); font-family: Georgia, serif; font-size: 18px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;">The first marketed soft drinks appeared in the 17th century as a mixture of<span>&nbsp;</span></span><a href="https://www.britannica.com/science/water" class="md-crosslink" data-show-preview="true" style=" color: var(--link-color); text-decoration: underline; font-family: Georgia, serif; font-size: 18px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255);">water</a><span style="color: rgb(26, 26, 26); font-family: Georgia, serif; font-size: 18px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;"><span>&nbsp;</span>and<span>&nbsp;</span></span><a href="https://www.britannica.com/plant/lemon" class="md-crosslink" data-show-preview="true" style=" color: var(--link-color); text-decoration: underline; font-family: Georgia, serif; font-size: 18px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255);">lemon</a><span style="color: rgb(26, 26, 26); font-family: Georgia, serif; font-size: 18px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;"><span>&nbsp;</span>juice sweetened with honey. In 1676 the Compagnie de Limonadiers was formed in Paris and granted a monopoly for the sale of its products. Vendors carried tanks on their backs from which they dispensed cups of lemonade.</span><br></p>', 1, 0, N'Regular Black', N'/images/product/b1c8b458-5be6-4f6c-8ee2-0ff3792901a8.jpg', 2013)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ShopFavorites], [CustomerFavorites], [Color], [ImageUrl], [CategoryId]) VALUES (2011, N'Titan 202', N'<p><span style="color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Titan Company commenced operations in 1984 under the name Titan Watches Limited. In 1994, Titan diversified into jewellery with<span>&nbsp;</span></span><a href="https://en.wikipedia.org/wiki/Tanishq" title="Tanishq" style="text-decoration: none; color: rgb(51, 102, 204); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal;">Tanishq</a><span style="color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;"><span>&nbsp;</span>and subsequently into eyewear with Titan Eyeplus. In 2005, it launched its youth fashion accessories brand<span>&nbsp;</span></span><a href="https://en.wikipedia.org/wiki/Fastrack_(fashion_accessories)" class="mw-redirect" title="Fastrack (fashion accessories)" style="text-decoration: none; color: rgb(51, 102, 204); background: none rgb(255, 255, 255); font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal;">Fastrack</a><span style="color: rgb(32, 33, 34); font-family: sans-serif; font-size: 14px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;">.</span></p>', 1, 1, N'Silver', N'/images/product/c9eba812-18b7-483f-b378-7373acd6e1be.jpg', 2006)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ShopFavorites], [CustomerFavorites], [Color], [ImageUrl], [CategoryId]) VALUES (2012, N'Casio 45', N'<p><span style=" font-size: 14px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; color: rgb(32, 33, 34); font-family: sans-serif; background-color: rgb(255, 255, 255); float: none; display: inline !important;">Titan Company commenced operations in 1984 under the name Titan Watches Limited. In 1994, Titan diversified into jewellery with<span>&nbsp;</span></span><a href="https://en.wikipedia.org/wiki/Tanishq" title="Tanishq" style=" color: rgb(51, 102, 204); text-decoration: none; background: none rgb(255, 255, 255); font-size: 14px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; font-family: sans-serif;">Tanishq</a><span style=" font-size: 14px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; color: rgb(32, 33, 34); font-family: sans-serif; background-color: rgb(255, 255, 255); float: none; display: inline !important;"><span>&nbsp;</span>and subsequently into eyewear with Titan Eyeplus. In 2005, it launched its youth fashion accessories brand<span>&nbsp;</span></span><a href="https://en.wikipedia.org/wiki/Fastrack_(fashion_accessories)" class="mw-redirect" title="Fastrack (fashion accessories)" style=" color: rgb(51, 102, 204); text-decoration: none; background: none rgb(255, 255, 255); font-size: 14px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; font-family: sans-serif;">Fastrack</a><span style=" font-size: 14px; font-style: normal; font-weight: 400; text-align: start; text-indent: 0px; white-space: normal; color: rgb(32, 33, 34); font-family: sans-serif; background-color: rgb(255, 255, 255); float: none; display: inline !important;">.</span></p>', 1, 1, N'Silver', N'/images/product/4953900a-87a2-435d-9eab-ccda6f97c531.png', 2006)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ShopFavorites], [CustomerFavorites], [Color], [ImageUrl], [CategoryId]) VALUES (4023, N'Drinkin Water', N'<p>xyz</p>', 0, 1, N'regular', N'/images/product/49968a92-0aa8-4616-9a8d-45092fb3a3f4.jpg', 2013)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Tepm_DelInfo_Cat_Prod] ([CategoryId], [CategoryName], [ProductId], [ProductName], [ProductPriceId], [ProductPrice], [UserId], [Date]) VALUES (2019, N'11we', 2029, N'rrtr', 2048, 232, N'0', CAST(N'2024-01-11T13:30:43.427' AS DateTime))
INSERT [dbo].[Tepm_DelInfo_Cat_Prod] ([CategoryId], [CategoryName], [ProductId], [ProductName], [ProductPriceId], [ProductPrice], [UserId], [Date]) VALUES (2019, N'11we', 2029, N'rrtr', 2049, 34343, N'0', CAST(N'2024-01-11T13:30:43.427' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TestCharacters] ON 

INSERT [dbo].[TestCharacters] ([CharId], [CharName], [HitPoints], [UserId]) VALUES (1, N'A', N'700', 1)
INSERT [dbo].[TestCharacters] ([CharId], [CharName], [HitPoints], [UserId]) VALUES (2, N'B', N'600', 2)
INSERT [dbo].[TestCharacters] ([CharId], [CharName], [HitPoints], [UserId]) VALUES (3, N'C', N'100', 3)
SET IDENTITY_INSERT [dbo].[TestCharacters] OFF
GO
SET IDENTITY_INSERT [dbo].[TestUsers] ON 

INSERT [dbo].[TestUsers] ([UserId], [UserName]) VALUES (1, N'Rasif')
INSERT [dbo].[TestUsers] ([UserId], [UserName]) VALUES (2, N'Joy')
INSERT [dbo].[TestUsers] ([UserId], [UserName]) VALUES (3, N'Nizam')
SET IDENTITY_INSERT [dbo].[TestUsers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 7/15/2024 3:44:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/15/2024 3:44:14 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 7/15/2024 3:44:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 7/15/2024 3:44:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 7/15/2024 3:44:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/15/2024 3:44:14 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/15/2024 3:44:14 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductPrices_ProductId]    Script Date: 7/15/2024 3:44:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductPrices_ProductId] ON [dbo].[ProductPrices]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 7/15/2024 3:44:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ProductPrices]  WITH CHECK ADD  CONSTRAINT [FK_ProductPrices_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductPrices] CHECK CONSTRAINT [FK_ProductPrices_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[TestCharacters]  WITH CHECK ADD  CONSTRAINT [FK_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[TestUsers] ([UserId])
GO
ALTER TABLE [dbo].[TestCharacters] CHECK CONSTRAINT [FK_UserId]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllCharacters]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllCharacters] 
AS
	SELECT * from TestCharacters
Go;
GO
/****** Object:  StoredProcedure [dbo].[SelectUserCharacters]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectUserCharacters] 
 @userId int
AS
BEGIN
   SET NOCOUNT ON;
	SELECT * from TestCharacters where UserId=@userId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCategory]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteCategory]
 @CategoryId int 
AS
BEGIN
 insert into Tepm_DelInfo_Cat_Prod (CategoryId,CategoryName,ProductId,ProductName,ProductPriceId  ,ProductPrice ,UserId, date)
 select  0,'0',ProductId,'0',id,price,0,CURRENT_TIMESTAMP from ProductPrices
 where ProductId in ( select id from Products
 where CategoryId= @CategoryId) 

update t
set t.categoryid = c.Id,
t.categoryName=c.Name,
t.ProductName=p.Name
from 
Categories c, Products p,Tepm_DelInfo_Cat_Prod t
where
c.Id=p.CategoryId
and p.Id=t.ProductId


  delete from ProductPrices
  where ProductId in ( select id from Products
  where CategoryId=@CategoryId) 

  delete from Products
  where CategoryId=@CategoryId

  delete from Categories
  where Id=@CategoryId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCharacterHitPoints]    Script Date: 7/15/2024 3:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCharacterHitPoints] 
 @CharacterId int ,@Hitpoints int 
AS
BEGIN
   update TestCharacters 
   set HitPoints=@Hitpoints
   where CharId=@CharacterId
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[30] 2[21] 3) )"
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
         Begin Table = "Categories"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 254
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 40
               Left = 568
               Bottom = 322
               Right = 811
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
         Column = 5676
         Alias = 2316
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 588
         Or = 2268
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_CategoryProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_CategoryProduct'
GO
USE [master]
GO
ALTER DATABASE [BlazorBoot_EcommerceDb] SET  READ_WRITE 
GO
