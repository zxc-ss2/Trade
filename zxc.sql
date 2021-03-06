USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 22.05.2022 23:13:46 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 22.05.2022 23:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 22.05.2022 23:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 22.05.2022 23:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductUnit] [nchar](10) NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountMax] [tinyint] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductPhotoPath] [nvarchar](max) NULL,
	[ProductStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__2EA7DCD55DFC5938] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 22.05.2022 23:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22.05.2022 23:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserRole] [int] NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__User__1788CCAC34199953] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'0YGHZ7', N'Очки защитные ', N'шт.       ', CAST(700.0000 AS Decimal(19, 4)), 9, N'Husqvarna', N'Защита лица, глаз, головы', 9, 36, N'Очки защитные Husqvarna Clear (5449638-01) открытые с прозрачными линзами', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'2G3280', N'Угол наружный', N'шт.       ', CAST(795.0000 AS Decimal(19, 4)), 16, N'Vinylon', N'Стеновые и фасадные материалы', 9, 20, N'Угол наружный Vinylon 3050 мм серо-голубой', NULL, N'2G3280.jpg', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'3L7RCZ', N'Газобетон', N'шт.       ', CAST(7400.0000 AS Decimal(19, 4)), 7, N'ЛСР', N'Стеновые и фасадные материалы', 2, 20, N'Газобетон ЛСР 100х250х625 мм D400', NULL, N'3L7RCZ.jpg', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'3XBOTN', N'Керамзит фракция', N'шт.       ', CAST(110.0000 AS Decimal(19, 4)), 14, N'MixMaster', N'Общестроительные материалы', 5, 21, N'Керамзит фракция 10-20 мм 0,05 куб.м', NULL, N'3XBOTN.jpg', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'4JR1HN', N'Шпатель', N'шт.       ', CAST(26.0000 AS Decimal(19, 4)), 3, N'Hesler', N'Ручной инструмент', 6, 7, N'Шпатель малярный 100 мм с пластиковой ручкой', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'4WZEOT', N'Лезвие для ножа ', N'шт.       ', CAST(110.0000 AS Decimal(19, 4)), 2, N'Armero', N'Ручной инструмент', 6, 17, N'Лезвие для ножа Armero 18 мм прямое (10 шт.)', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'61PGH3', N'Очки защитные', N'шт.       ', CAST(184.0000 AS Decimal(19, 4)), 2, N'KILIMGRIN', N'Защита лица, глаз, головы', 6, 25, N'Очки защитные Delta Plus KILIMANDJARO (KILIMGRIN) открытые с прозрачными линзами', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'81F1WG', N'Каска защитная', N'шт.       ', CAST(1500.0000 AS Decimal(19, 4)), 1, N'Delta', N'Защита лица, глаз, головы', 2, 13, N'Каска защитная Delta Plus BASEBALL DIAMOND V UP (DIAM5UPBCFLBS) белая', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'83M5ME', N'Кисть', N'шт.       ', CAST(122.0000 AS Decimal(19, 4)), 16, N'Armero', N'Ручной инструмент', 9, 26, N'Кисть плоская смешанная щетина 100х12 мм для красок и антисептиков на водной основе', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'ASPXSG', N'Ровнитель', N'шт.       ', CAST(711.0000 AS Decimal(19, 4)), 17, N'Weber', N'Сухие строительные смеси и гидроизоляция', 10, 20, N'Ровнитель (наливной пол) финишный Weber.vetonit 4100 самовыравнивающийся высокопрочный 20 кг', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'BPV4MM', N'Пленка техническая', N'шт.       ', CAST(8.0000 AS Decimal(19, 4)), 13, N'Изостронг', N'Общестроительные материалы', 8, 2, N'Пленка техническая полиэтиленовая Изостронг 60 мк 3 м рукав 1,5 м, пог.м', NULL, N'BPV4MM.jpg', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'EQ6RKO', N'Подшлемник', N'шт.       ', CAST(36.0000 AS Decimal(19, 4)), 17, N'Husqvarna', N'Защита лица, глаз, головы', 3, 22, N'Подшлемник для каски одноразовый', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'F895RB', N'Песок строительный', N'шт.       ', CAST(102.0000 AS Decimal(19, 4)), 17, N'Knauf', N'Общестроительные материалы', 6, 7, N'Песок строительный 50 кг', NULL, N'F895RB.jpg', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'GN6ICZ', N'Каска защитная ', N'шт.       ', CAST(154.0000 AS Decimal(19, 4)), 10, N'Исток', N'Защита лица, глаз, головы', 6, 8, N'Каска защитная Исток (КАС001О) оранжевая', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'I6MH89', N'Валик', N'шт.       ', CAST(326.0000 AS Decimal(19, 4)), 12, N'Wenzo Roma', N'Ручной инструмент', 6, 3, N'Валик Wenzo Roma полиакрил 250 мм ворс 18 мм для красок грунтов и антисептиков на водной основе с рукояткой', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'JVL42J', N'Пленка техническая', N'шт.       ', CAST(13.0000 AS Decimal(19, 4)), 1, N'Изостронг', N'Общестроительные материалы', 4, 34, N'Пленка техническая полиэтиленовая Изостронг 100 мк 3 м рукав 1,5 м, пог.м', NULL, N'JVL42J.jpg', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'K0YACK', N'Смесь цементно-песчаная', N'шт.       ', CAST(160.0000 AS Decimal(19, 4)), 9, N'MixMaster', N'Сухие строительные смеси и гидроизоляция', 8, 19, N'Смесь цементно-песчаная (ЦПС) 300 по ТУ MixMaster Универсал 25 кг', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'LPDDM4', N'Штукатурка гипсовая', N'шт.       ', CAST(500.0000 AS Decimal(19, 4)), 17, N'Knauf', N'Сухие строительные смеси и гидроизоляция', 6, 38, N'Штукатурка гипсовая Knauf Ротбанд 30 кг', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'LQ48MW', N'Штукатурка гипсовая', N'шт.       ', CAST(462.0000 AS Decimal(19, 4)), 16, N'Weber', N'Сухие строительные смеси и гидроизоляция', 6, 33, N'Штукатурка гипсовая Knauf МП-75 машинная 30 кг', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'M26EXW', N'Клей для плитки, керамогранита и камня', N'шт.       ', CAST(340.0000 AS Decimal(19, 4)), 8, N'Knauf', N'Сухие строительные смеси и гидроизоляция', 8, 2, N'Клей для плитки, керамогранита и камня Крепс Усиленный серый (класс С1) 25 кг', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'MIO8YV', N'Кирпич', N'шт.       ', CAST(30.0000 AS Decimal(19, 4)), 9, N'ВОЛМА', N'Стеновые и фасадные материалы', 9, 31, N'Кирпич рядовой Боровичи полнотелый М150 250х120х65 мм 1NF', NULL, N'MIO8YV.jpg', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'O43COU', N'Шпаклевка', N'шт.       ', CAST(750.0000 AS Decimal(19, 4)), 9, N'ВОЛМА', N'Сухие строительные смеси и гидроизоляция', 1, 16, N'Шпаклевка полимерная Weber.vetonit LR + для сухих помещений белая 20 кг', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'PMEZMH', N'Цемент', N'шт.       ', CAST(440.0000 AS Decimal(19, 4)), 10, N'М500', N'Общестроительные материалы', 8, 34, N'Цемент Евроцемент М500 Д0 ЦЕМ I 42,5 50 кг', NULL, N'PMEZMH.jpg', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'QHNOKR', N'Маска защитная', N'шт.       ', CAST(251.0000 AS Decimal(19, 4)), 6, N'Исток', N'Защита лица, глаз, головы', 2, 22, N'Маска защитная Исток (ЩИТ001) ударопрочная и термостойкая', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'S72AM3', N'Пазогребневая плита ', N'шт.       ', CAST(500.0000 AS Decimal(19, 4)), 9, N'ВОЛМА', N'Стеновые и фасадные материалы', 5, 35, N'Пазогребневая плита ВОЛМА Гидро 667х500х80 мм полнотелая', NULL, N'S72AM3.jpg', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'UER2QD', N'Скоба для пазогребневой плиты', N'шт.       ', CAST(25.0000 AS Decimal(19, 4)), 20, N'Knauf', N'Стеновые и фасадные материалы', 8, 27, N'Скоба для пазогребневой плиты Knauf С1 120х100 мм', NULL, N'UER2QD.jpg', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'Z3LO0U', N'Очки защитные ', N'шт.       ', CAST(228.0000 AS Decimal(19, 4)), 19, N'RUIZ', N'Защита лица, глаз, головы', 9, 11, N'Очки защитные Delta Plus RUIZ (RUIZ1VI) закрытые с прозрачными линзами', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'Z3XFSP', N'Нож строительный ', N'шт.       ', CAST(63.0000 AS Decimal(19, 4)), 19, N'Hesler', N'Ручной инструмент', 8, 5, N'Нож строительный Hesler 18 мм с ломающимся лезвием пластиковый корпус', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'ZKQ5FF', N'Лезвие для ножа ', N'шт.       ', CAST(65.0000 AS Decimal(19, 4)), 13, N'Hesler', N'Ручной инструмент', 6, 6, N'Лезвие для ножа Hesler 18 мм прямое (10 шт.)', NULL, N'', N'')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto], [ProductPhotoPath], [ProductStatus]) VALUES (N'ZR70B4', N'Кирпич', N'шт.       ', CAST(16.0000 AS Decimal(19, 4)), 3, N'Павловский завод ', N'Стеновые и фасадные материалы', 3, 26, N'Кирпич рядовой силикатный Павловский завод полнотелый М200 250х120х65 мм 1NF', NULL, N'', N'')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (1, 1, N'Басова', N'Амина', N'Кирилловна', N'klh7pi4rcbtz@gmail.com', N'2L6KZG')
INSERT [dbo].[User] ([UserID], [UserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (2, 1, N'Михайлов', N'Андрей', N'Денисович', N'gn0354mbiork@outlook.com', N'uzWC67')
INSERT [dbo].[User] ([UserID], [UserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (3, 1, N'Сидоров', N'Егор', N'Александрович', N'1o4l05k8dwpv@yahoo.com', N'8ntwUp')
INSERT [dbo].[User] ([UserID], [UserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (4, 2, N'Аксенова', N'Ульяна', N'Ивановна', N'hsqixl2vebuz@mail.com', N'YOyhfR')
INSERT [dbo].[User] ([UserID], [UserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (5, 2, N'Васильева', N'Камила', N'Ивановна', N'towkse0hf26b@outlook.com', N'RSbvHv')
INSERT [dbo].[User] ([UserID], [UserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (6, 2, N'Ильин', N'Артём', N'Родионович', N'khx0ncdwz4uj@gmail.com', N'rwVDh9')
INSERT [dbo].[User] ([UserID], [UserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (7, 3, N'Васильева', N'Василиса', N'Фёдоровна', N'01zji3wfuq7h@outlook.com', N'LdNyos')
INSERT [dbo].[User] ([UserID], [UserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (8, 3, N'Кудрявцева', N'Василиса', N'Матвеевна', N'am65k18q7bwp@mail.com', N'gynQMT')
INSERT [dbo].[User] ([UserID], [UserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (9, 3, N'Кириллова', N'Николь', N'Святославовна', N'wt9q8i6ypx47@outlook.com', N'AtnDjr')
INSERT [dbo].[User] ([UserID], [UserRole], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (10, 3, N'Андреева', N'Полина', N'Артёмовна', N'4o72gufv3xlz@tutanota.com', N'JlFRCZ')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__267ABA7A] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__267ABA7A]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
