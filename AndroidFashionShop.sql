USE [master]
GO
/****** Object:  Database [AndroidFashionShop]    Script Date: 9/22/2024 10:23:32 PM ******/
CREATE DATABASE [AndroidFashionShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AndroidFashionShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AndroidFashionShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AndroidFashionShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AndroidFashionShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AndroidFashionShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AndroidFashionShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AndroidFashionShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AndroidFashionShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AndroidFashionShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AndroidFashionShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AndroidFashionShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AndroidFashionShop] SET  MULTI_USER 
GO
ALTER DATABASE [AndroidFashionShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AndroidFashionShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AndroidFashionShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AndroidFashionShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AndroidFashionShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AndroidFashionShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AndroidFashionShop] SET QUERY_STORE = OFF
GO
USE [AndroidFashionShop]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/22/2024 10:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[phone_number] [varchar](50) NULL,
	[email] [varchar](150) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[address] [text] NULL,
	[avatar] [text] NULL,
	[status] [bit] NULL,
	[update_date] [datetime] NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 9/22/2024 10:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[product_id] [int] NULL,
	[feedback_image] [varchar](max) NULL,
	[feedback_content] [nvarchar](max) NULL,
	[rate_star] [float] NULL,
	[status] [bit] NULL,
	[create_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_detail]    Script Date: 9/22/2024 10:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_detail](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[product_price] [float] NULL,
	[quantity] [int] NULL,
	[total_cost] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/22/2024 10:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[staff_id] [int] NULL,
	[receiver_fullname] [nvarchar](100) NULL,
	[receiver_gender] [nvarchar](50) NULL,
	[receiver_email] [varchar](max) NULL,
	[phone_number] [nvarchar](max) NULL,
	[receiver_address] [nvarchar](max) NULL,
	[order_date] [datetime] NULL,
	[total_cost] [float] NULL,
	[note] [nvarchar](max) NULL,
	[order_status] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/22/2024 10:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](50) NULL,
	[original_price] [float] NULL,
	[sale_price] [float] NULL,
	[quantity] [int] NULL,
	[category_id] [int] NULL,
	[thumbnail] [varchar](max) NULL,
	[product_image] [varchar](max) NULL,
	[summary] [nvarchar](max) NULL,
	[product_detail] [nvarchar](max) NULL,
	[product_status] [bit] NULL,
	[create_date] [datetime] NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_category]    Script Date: 9/22/2024 10:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/22/2024 10:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 9/22/2024 10:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[phone_number] [varchar](50) NULL,
	[email] [varchar](150) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[address] [nvarchar](max) NULL,
	[avatar] [varchar](max) NULL,
	[role_id] [int] NULL,
	[status] [bit] NULL,
	[update_date] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Staff__1963DD9C0EE3BE0B] PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__staff_id__412EB0B6] FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staff] ([staff_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__staff_id__412EB0B6]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__staff_id__4222D4EF] FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staff] ([staff_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__staff_id__4222D4EF]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Product_category] ([category_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Product_category] ([category_id])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK__Staff__role_id__44FF419A] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK__Staff__role_id__44FF419A]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK__Staff__role_id__45F365D3] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK__Staff__role_id__45F365D3]
GO
USE [master]
GO
ALTER DATABASE [AndroidFashionShop] SET  READ_WRITE 
GO
