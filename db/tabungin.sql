USE [master]
GO
/****** Object:  Database [tabungin]    Script Date: 7/17/2025 9:27:59 PM ******/
CREATE DATABASE [tabungin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tabungin', FILENAME = N'D:\Program Files\MSSQL16.SQLEXPRESS\MSSQL\DATA\tabungin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tabungin_log', FILENAME = N'D:\Program Files\MSSQL16.SQLEXPRESS\MSSQL\DATA\tabungin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [tabungin] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tabungin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tabungin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tabungin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tabungin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tabungin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tabungin] SET ARITHABORT OFF 
GO
ALTER DATABASE [tabungin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tabungin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tabungin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tabungin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tabungin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tabungin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tabungin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tabungin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tabungin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tabungin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tabungin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tabungin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tabungin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tabungin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tabungin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tabungin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tabungin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tabungin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tabungin] SET  MULTI_USER 
GO
ALTER DATABASE [tabungin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tabungin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tabungin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tabungin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tabungin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tabungin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tabungin] SET QUERY_STORE = ON
GO
ALTER DATABASE [tabungin] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tabungin]
GO
/****** Object:  Table [dbo].[detailtarget]    Script Date: 7/17/2025 9:27:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailtarget](
	[detail_id] [bigint] NOT NULL,
	[target_id] [bigint] NOT NULL,
	[target_harian] [bigint] NULL,
	[target_mingguan] [bigint] NULL,
	[target_bulanan] [bigint] NULL,
	[strategi_menabung] [varchar](255) NULL,
	[catatan] [varchar](255) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logaktivitas]    Script Date: 7/17/2025 9:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logaktivitas](
	[log_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[jenis_aktivitas] [varchar](255) NOT NULL,
	[detail_aktivitas] [varchar](255) NOT NULL,
	[ip_address] [varchar](255) NOT NULL,
	[user_agent] [varchar](255) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[data_tambahan] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[setoran]    Script Date: 7/17/2025 9:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[setoran](
	[setoran_id] [bigint] NOT NULL,
	[transaksi_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[target_id] [bigint] NOT NULL,
	[jumlah_setoran] [bigint] NOT NULL,
	[sumber_dana] [varchar](255) NOT NULL,
	[bukti_setoran] [varchar](255) NOT NULL,
	[status_verifikasi] [varchar](255) NOT NULL,
	[tanggal_setoran] [datetime] NOT NULL,
	[catatan_setoran] [varchar](255) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[setoran_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[targettabungan]    Script Date: 7/17/2025 9:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[targettabungan](
	[target_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[nama_target] [varchar](255) NOT NULL,
	[jumlah_data_target] [bigint] NOT NULL,
	[saldo_terkumpul] [bigint] NOT NULL,
	[periode] [varchar](255) NOT NULL,
	[tanggal_mulai_target] [datetime] NOT NULL,
	[tanggal_selesai_target] [datetime] NOT NULL,
	[status_target] [varchar](255) NOT NULL,
	[deskripsi] [varchar](255) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[target_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaksitabungan]    Script Date: 7/17/2025 9:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaksitabungan](
	[transaksi_id] [bigint] NOT NULL,
	[target_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[jenis_transaksi] [varchar](255) NOT NULL,
	[jumlah_transaksi] [bigint] NOT NULL,
	[metode_pembayaran] [varchar](255) NOT NULL,
	[status_transaksi] [varchar](255) NOT NULL,
	[keterangan] [varchar](255) NULL,
	[referensi_pembayaran] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[transaksi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 7/17/2025 9:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] NOT NULL,
	[username] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password_hash] [varchar](255) NOT NULL,
	[nama_lengkap] [varchar](255) NOT NULL,
	[no_telp] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[is_active] [bit] NULL,
	[last_login] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detailtarget]  WITH CHECK ADD  CONSTRAINT [target_to_detail] FOREIGN KEY([target_id])
REFERENCES [dbo].[targettabungan] ([target_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detailtarget] CHECK CONSTRAINT [target_to_detail]
GO
ALTER TABLE [dbo].[logaktivitas]  WITH CHECK ADD  CONSTRAINT [user_to_log] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[logaktivitas] CHECK CONSTRAINT [user_to_log]
GO
ALTER TABLE [dbo].[setoran]  WITH CHECK ADD  CONSTRAINT [target_to_setoran] FOREIGN KEY([target_id])
REFERENCES [dbo].[targettabungan] ([target_id])
GO
ALTER TABLE [dbo].[setoran] CHECK CONSTRAINT [target_to_setoran]
GO
ALTER TABLE [dbo].[setoran]  WITH CHECK ADD  CONSTRAINT [transaksi_to_setoran] FOREIGN KEY([transaksi_id])
REFERENCES [dbo].[transaksitabungan] ([transaksi_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[setoran] CHECK CONSTRAINT [transaksi_to_setoran]
GO
ALTER TABLE [dbo].[setoran]  WITH CHECK ADD  CONSTRAINT [user_to_setoran] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[setoran] CHECK CONSTRAINT [user_to_setoran]
GO
ALTER TABLE [dbo].[targettabungan]  WITH CHECK ADD  CONSTRAINT [target_to_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[targettabungan] CHECK CONSTRAINT [target_to_users]
GO
ALTER TABLE [dbo].[transaksitabungan]  WITH CHECK ADD  CONSTRAINT [target_to_transaksi] FOREIGN KEY([target_id])
REFERENCES [dbo].[targettabungan] ([target_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[transaksitabungan] CHECK CONSTRAINT [target_to_transaksi]
GO
ALTER TABLE [dbo].[transaksitabungan]  WITH CHECK ADD  CONSTRAINT [user_to_transaksi] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[transaksitabungan] CHECK CONSTRAINT [user_to_transaksi]
GO
USE [master]
GO
ALTER DATABASE [tabungin] SET  READ_WRITE 
GO
