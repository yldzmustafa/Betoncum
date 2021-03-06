USE [Betoncum]
GO
/****** Object:  Table [dbo].[Bildirim]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bildirim](
	[BildirimID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NULL,
	[Baslik] [nvarchar](50) NULL,
	[Konu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bildirim] PRIMARY KEY CLUSTERED 
(
	[BildirimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fatura]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fatura](
	[Faturaid] [int] IDENTITY(1,1) NOT NULL,
	[FaturaTutari] [money] NULL,
 CONSTRAINT [PK_Fatura] PRIMARY KEY CLUSTERED 
(
	[Faturaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaturaDetay]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaturaDetay](
	[FaturaDetayID] [int] IDENTITY(1,1) NOT NULL,
	[FaturaNo] [int] NULL,
	[KesimTarihi] [date] NULL,
	[SonÖdemeTarihi] [date] NULL,
 CONSTRAINT [PK_FaturaDetay] PRIMARY KEY CLUSTERED 
(
	[FaturaDetayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoriler]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoriler](
	[favoriID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NULL,
	[MusteriID] [int] NULL,
 CONSTRAINT [PK_Favoriler] PRIMARY KEY CLUSTERED 
(
	[favoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirmaDetay]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmaDetay](
	[KKDetayID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAdi] [nvarchar](50) NULL,
	[İl] [nvarchar](50) NULL,
	[İlçe] [nvarchar](50) NULL,
	[Telefon] [nvarchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[FirmaID] [int] NULL,
	[Hakkinda] [nvarchar](max) NULL,
 CONSTRAINT [PK_KKDetay] PRIMARY KEY CLUSTERED 
(
	[KKDetayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirmaPersonel]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmaPersonel](
	[FirmaPrsnlID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[SiparisID] [int] NULL,
	[FirmaID] [int] NULL,
 CONSTRAINT [PK_FirmaPersonel] PRIMARY KEY CLUSTERED 
(
	[FirmaPrsnlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirmaTable]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmaTable](
	[FirmaID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Sifresi] [int] NULL,
 CONSTRAINT [PK_Kurumsal_Kullanici] PRIMARY KEY CLUSTERED 
(
	[FirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ilceler]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ilceler](
	[ilce_no] [int] NOT NULL,
	[isim] [varchar](50) NULL,
	[il_no] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iller]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iller](
	[il_no] [int] NOT NULL,
	[isim] [varchar](50) NULL,
	[FirmaDetayID] [int] NULL,
	[MusteriDetayId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[il_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[İnsanKaynaklari]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İnsanKaynaklari](
	[InsanKayID] [int] IDENTITY(1,1) NOT NULL,
	[PrsGirisTarihi] [date] NULL,
	[PrsCikisTarihi] [date] NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[Maasi] [money] NULL,
	[FirmaID] [int] NULL,
 CONSTRAINT [PK_İnsanKaynaklari] PRIMARY KEY CLUSTERED 
(
	[InsanKayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KatkiTable]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KatkiTable](
	[KatkiID] [int] IDENTITY(1,1) NOT NULL,
	[UrunID] [int] NULL,
	[KatkiAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_KatkiTable] PRIMARY KEY CLUSTERED 
(
	[KatkiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MikserDurum]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MikserDurum](
	[MikserSayisiID] [int] IDENTITY(1,1) NOT NULL,
	[Kapasitesi] [tinyint] NULL,
	[MikserSayisi] [tinyint] NULL,
	[FirmaID] [int] NULL,
 CONSTRAINT [PK_MikserDurum] PRIMARY KEY CLUSTERED 
(
	[MikserSayisiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muhasebe]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muhasebe](
	[MuhasebeID] [int] IDENTITY(1,1) NOT NULL,
	[maliyeti] [money] NULL,
	[FirmaID] [int] NULL,
 CONSTRAINT [PK_Muhasebe] PRIMARY KEY CLUSTERED 
(
	[MuhasebeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muhasebeci]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muhasebeci](
	[MuhasebeciID] [int] IDENTITY(1,1) NOT NULL,
	[MuhasebeciAdi] [nvarchar](50) NULL,
	[MuhasebeciSoyadi] [nvarchar](50) NULL,
	[Telefon] [nvarchar](11) NULL,
	[MuhasebeID] [int] NULL,
 CONSTRAINT [PK_Muhasebeci] PRIMARY KEY CLUSTERED 
(
	[MuhasebeciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusteriDetay]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusteriDetay](
	[MusteriDetayID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[Adresi] [nvarchar](max) NULL,
	[Telefon] [nvarchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[İl] [nvarchar](50) NULL,
	[ilce] [nvarchar](50) NULL,
	[MusteriID] [int] NULL,
 CONSTRAINT [PK_MusteriDetay] PRIMARY KEY CLUSTERED 
(
	[MusteriDetayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusteriTable]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusteriTable](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[sifresi] [int] NULL,
 CONSTRAINT [PK_Bireysel_Kullanici] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reklam]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reklam](
	[ReklamID] [int] IDENTITY(1,1) NOT NULL,
	[ReklamTurari] [money] NULL,
	[Platform] [nvarchar](50) NULL,
 CONSTRAINT [PK_Reklam] PRIMARY KEY CLUSTERED 
(
	[ReklamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparis]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis](
	[SatisID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriID] [int] NULL,
	[FirmaID] [int] NULL,
	[SiparisTarihi] [date] NULL,
	[UrunID] [int] NULL,
	[BetonCesidi] [nvarchar](50) NULL,
	[CimentoCesidi] [nvarchar](50) NULL,
	[KatkiCesidi] [nvarchar](50) NULL,
	[KivamCesidi] [nvarchar](50) NULL,
	[BirimFiyati] [money] NULL,
	[Miktar] [bigint] NULL,
	[Firma] [nvarchar](50) NULL,
	[SiparisDurumu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Siparis] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisDetay]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDetay](
	[SiparisDetayID] [int] IDENTITY(1,1) NOT NULL,
	[UrunID] [int] NULL,
	[BirimFiyat] [money] NULL,
	[Miktar] [bigint] NULL,
 CONSTRAINT [PK_SiparisDetay] PRIMARY KEY CLUSTERED 
(
	[SiparisDetayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisTablosu]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisTablosu](
	[SiparisID] [int] IDENTITY(1,1) NOT NULL,
	[BetonCesidi] [nvarchar](50) NULL,
	[CimentoCesidi] [nvarchar](50) NULL,
	[KatkiCesidi] [nvarchar](50) NULL,
	[KivamCesidi] [nvarchar](50) NULL,
	[SiparisTarihi] [date] NULL,
	[BirimFiyat] [money] NULL,
	[Miktar] [bigint] NULL,
	[Firma] [nvarchar](50) NULL,
 CONSTRAINT [PK_SiparisTablosu] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisTakibi]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisTakibi](
	[TakipID] [int] IDENTITY(1,1) NOT NULL,
	[Durum] [nvarchar](50) NULL,
 CONSTRAINT [PK_SiparisTakibi] PRIMARY KEY CLUSTERED 
(
	[TakipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunDetay]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunDetay](
	[UrunDetayID] [int] IDENTITY(1,1) NOT NULL,
	[CimentoSinifi] [nvarchar](50) NULL,
	[Kivam] [nvarchar](50) NULL,
 CONSTRAINT [PK_UrunDetay] PRIMARY KEY CLUSTERED 
(
	[UrunDetayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [nvarchar](50) NULL,
	[FirmaID] [int] NULL,
	[BirimFiyat] [money] NULL,
	[Stok] [nchar](10) NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 12.04.2022 16:33:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorum](
	[yorumid] [int] IDENTITY(1,1) NOT NULL,
	[puan] [tinyint] NULL,
	[yorum] [nvarchar](max) NULL,
	[MusteriID] [int] NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[yorumid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bildirim] ON 

INSERT [dbo].[Bildirim] ([BildirimID], [FirmaID], [Baslik], [Konu]) VALUES (1, 15, N'%20 indirim', N'Seçtiğiniz ürünlerde %20 indirim uygulanacak')
INSERT [dbo].[Bildirim] ([BildirimID], [FirmaID], [Baslik], [Konu]) VALUES (1002, 18, N'%20 İndirim', N'%20 indirim uygulanacak')
SET IDENTITY_INSERT [dbo].[Bildirim] OFF
GO
SET IDENTITY_INSERT [dbo].[Favoriler] ON 

INSERT [dbo].[Favoriler] ([favoriID], [FirmaID], [MusteriID]) VALUES (2013, 15, 10)
INSERT [dbo].[Favoriler] ([favoriID], [FirmaID], [MusteriID]) VALUES (2014, 16, 11)
INSERT [dbo].[Favoriler] ([favoriID], [FirmaID], [MusteriID]) VALUES (2015, 16, 10)
INSERT [dbo].[Favoriler] ([favoriID], [FirmaID], [MusteriID]) VALUES (2016, 17, 10)
INSERT [dbo].[Favoriler] ([favoriID], [FirmaID], [MusteriID]) VALUES (2017, 15, 11)
INSERT [dbo].[Favoriler] ([favoriID], [FirmaID], [MusteriID]) VALUES (3010, 15, 1010)
SET IDENTITY_INSERT [dbo].[Favoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[FirmaDetay] ON 

INSERT [dbo].[FirmaDetay] ([KKDetayID], [FirmaAdi], [İl], [İlçe], [Telefon], [Email], [FirmaID], [Hakkinda]) VALUES (2, N'Hakan Beton', N'Balıkesir', N'Akçakale', N'5333298741', N'@gmail.com', 15, N'HAKAN BETON 1950')
INSERT [dbo].[FirmaDetay] ([KKDetayID], [FirmaAdi], [İl], [İlçe], [Telefon], [Email], [FirmaID], [Hakkinda]) VALUES (3, N'albayrak', N'Adıyaman', N'Acıpayam', N'4546545654', N'dsfsfsdf', 16, NULL)
INSERT [dbo].[FirmaDetay] ([KKDetayID], [FirmaAdi], [İl], [İlçe], [Telefon], [Email], [FirmaID], [Hakkinda]) VALUES (4, N'asd', N'Adıyaman', N'Abana', N'221412', N'asdasdasd', 17, NULL)
INSERT [dbo].[FirmaDetay] ([KKDetayID], [FirmaAdi], [İl], [İlçe], [Telefon], [Email], [FirmaID], [Hakkinda]) VALUES (5, N'Serdar Beton', N'Adana', N'Abana', N'5312658975', N'serdar@gmail.com', 18, NULL)
INSERT [dbo].[FirmaDetay] ([KKDetayID], [FirmaAdi], [İl], [İlçe], [Telefon], [Email], [FirmaID], [Hakkinda]) VALUES (6, N'Kadir Beton', N'Adana', N'Abana', N'533255632', N'kadir@gmail.com', 19, NULL)
SET IDENTITY_INSERT [dbo].[FirmaDetay] OFF
GO
SET IDENTITY_INSERT [dbo].[FirmaTable] ON 

INSERT [dbo].[FirmaTable] ([FirmaID], [Adi], [Sifresi]) VALUES (15, N'hakan_98', 123)
INSERT [dbo].[FirmaTable] ([FirmaID], [Adi], [Sifresi]) VALUES (16, N'albayrak', 1234)
INSERT [dbo].[FirmaTable] ([FirmaID], [Adi], [Sifresi]) VALUES (17, N'demircibeton', 456)
INSERT [dbo].[FirmaTable] ([FirmaID], [Adi], [Sifresi]) VALUES (18, N'serdar', 123)
INSERT [dbo].[FirmaTable] ([FirmaID], [Adi], [Sifresi]) VALUES (19, N'kadir beton', 123)
SET IDENTITY_INSERT [dbo].[FirmaTable] OFF
GO
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (1, N'Abana', 37)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (2, N'Acıgöl', 50)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (3, N'Acıpayam', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (4, N'Adaklı', 12)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (5, N'Adalar', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (6, N'Adapazarı', 54)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (7, N'Adıyaman', 2)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (8, N'Adilcevaz', 13)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (9, N'Afşin', 46)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (10, N'Afyonkarahisar', 3)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (11, N'Ağaçören', 68)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (12, N'Ağın', 23)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (13, N'Ağlasun', 15)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (14, N'Ağlı', 37)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (15, N'Ağrı', 4)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (16, N'Ahırlı', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (17, N'Ahlat', 13)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (18, N'Ahmetli', 45)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (19, N'Akçaabat', 61)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (20, N'Akçadağ', 44)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (21, N'Akçakale', 63)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (22, N'Akçakent', 40)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (23, N'Akçakoca', 81)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (24, N'Akdağmadeni', 66)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (25, N'Akdeniz', 33)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (26, N'Akhisar', 45)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (27, N'Akıncılar', 58)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (28, N'Akkışla', 38)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (29, N'Akkuş', 52)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (30, N'Akören', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (31, N'Akpınar', 40)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (32, N'Aksaray', 68)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (33, N'Akseki', 7)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (34, N'Aksu', 7)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (35, N'Aksu', 32)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (36, N'Akşehir', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (37, N'Akyaka', 36)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (38, N'Akyazı', 54)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (39, N'Akyurt', 6)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (40, N'Alaca', 19)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (41, N'Alacakaya', 23)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (42, N'Alaçam', 55)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (43, N'Aladağ', 1)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (44, N'Alanya', 7)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (45, N'Alaplı', 67)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (46, N'Alaşehir', 45)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (47, N'Aliağa', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (48, N'Almus', 60)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (49, N'Alpu', 26)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (50, N'Altıeylül', 10)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (51, N'Altındağ', 6)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (52, N'Altınekin', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (53, N'Altınordu', 52)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (54, N'Altınova', 77)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (55, N'Altınözü', 31)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (56, N'Altıntaş', 43)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (57, N'Altınyayla', 15)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (58, N'Altınyayla', 58)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (59, N'Altunhisar', 51)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (60, N'Alucra', 28)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (61, N'Amasra', 74)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (62, N'Amasya', 5)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (63, N'Anamur', 33)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (64, N'Andırın', 46)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (65, N'Antakya', 31)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (66, N'Araban', 27)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (67, N'Araç', 37)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (68, N'Araklı', 61)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (69, N'Aralık', 76)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (70, N'Arapgir', 44)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (71, N'Ardahan', 75)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (72, N'Ardanuç', 8)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (73, N'Ardeşen', 53)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (74, N'Arguvan', 44)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (75, N'Arhavi', 8)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (76, N'Arıcak', 23)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (77, N'Arifiye', 54)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (78, N'Armutlu', 77)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (79, N'Arnavutköy', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (80, N'Arpaçay', 36)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (81, N'Arsin', 61)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (82, N'Arsuz', 31)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (83, N'Artova', 60)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (84, N'Artuklu', 47)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (85, N'Artvin', 8)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (86, N'Asarcık', 55)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (87, N'Aslanapa', 43)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (88, N'Aşkale', 25)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (89, N'Atabey', 32)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (90, N'Atakum', 55)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (91, N'Ataşehir', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (92, N'Atkaracalar', 18)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (93, N'Avanos', 50)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (94, N'Avcılar', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (95, N'Ayancık', 57)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (96, N'Ayaş', 6)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (97, N'Aybastı', 52)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (98, N'Aydıncık', 33)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (99, N'Aydıncık', 66)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (100, N'Aydıntepe', 69)
GO
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (101, N'Ayrancı', 70)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (102, N'Ayvacık', 17)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (103, N'Ayvacık', 55)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (104, N'Ayvalık', 10)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (105, N'Azdavay', 37)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (106, N'Aziziye', 25)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (107, N'Babadağ', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (108, N'Babaeski', 39)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (109, N'Bafra', 55)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (110, N'Bağcılar', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (111, N'Bağlar', 21)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (112, N'Bahçe', 80)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (113, N'Bahçelievler', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (114, N'Bahçesaray', 65)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (115, N'Bahşili', 71)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (116, N'Bakırköy', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (117, N'Baklan', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (118, N'Bala', 6)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (119, N'Balçova', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (120, N'Balışeyh', 71)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (121, N'Balya', 10)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (122, N'Banaz', 64)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (123, N'Bandırma', 10)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (124, N'Bartın', 74)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (125, N'Baskil', 23)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (126, N'Başakşehir', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (127, N'Başçiftlik', 60)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (128, N'Başiskele', 41)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (129, N'Başkale', 65)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (130, N'Başmakçı', 3)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (131, N'Başyayla', 70)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (132, N'Batman', 72)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (133, N'Battalgazi', 44)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (134, N'Bayat', 3)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (135, N'Bayat', 19)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (136, N'Bayburt', 69)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (137, N'Bayındır', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (138, N'Baykan', 56)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (139, N'Bayraklı', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (140, N'Bayramiç', 17)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (141, N'Bayramören', 18)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (142, N'Bayrampaşa', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (143, N'Bekilli', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (144, N'Belen', 31)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (145, N'Bergama', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (146, N'Besni', 2)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (147, N'Beşikdüzü', 61)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (148, N'Beşiktaş', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (149, N'Beşiri', 72)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (150, N'Beyağaç', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (151, N'Beydağ', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (152, N'Beykoz', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (153, N'Beylikdüzü', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (154, N'Beylikova', 26)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (155, N'Beyoğlu', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (156, N'Beypazarı', 6)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (157, N'Beyşehir', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (158, N'Beytüşşebap', 73)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (159, N'Biga', 17)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (160, N'Bigadiç', 10)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (161, N'Bilecik', 11)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (162, N'Bingöl', 12)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (163, N'Birecik', 63)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (164, N'Bismil', 21)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (165, N'Bitlis', 13)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (166, N'Bodrum', 48)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (167, N'Boğazkale', 19)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (168, N'Boğazlıyan', 66)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (169, N'Bolu', 14)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (170, N'Bolvadin', 3)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (171, N'Bor', 51)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (172, N'Borçka', 8)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (173, N'Bornova', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (174, N'Boyabat', 57)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (175, N'Bozcaada', 17)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (176, N'Bozdoğan', 9)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (177, N'Bozkır', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (178, N'Bozkurt', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (179, N'Bozkurt', 37)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (180, N'Bozova', 63)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (181, N'Boztepe', 40)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (182, N'Bozüyük', 11)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (183, N'Bozyazı', 33)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (184, N'Buca', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (185, N'Bucak', 15)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (186, N'Buharkent', 9)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (187, N'Bulancak', 28)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (188, N'Bulanık', 49)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (189, N'Buldan', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (190, N'Burdur', 15)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (191, N'Burhaniye', 10)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (192, N'Bünyan', 38)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (193, N'Büyükçekmece', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (194, N'Büyükorhan', 16)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (195, N'Canik', 55)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (196, N'Ceyhan', 1)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (197, N'Ceylanpınar', 63)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (198, N'Cide', 37)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (199, N'Cihanbeyli', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (200, N'Cizre', 73)
GO
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (201, N'Cumayeri', 81)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (202, N'Çağlayancerit', 46)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (203, N'Çal', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (204, N'Çaldıran', 65)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (205, N'Çamardı', 51)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (206, N'Çamaş', 52)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (207, N'Çameli', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (208, N'Çamlıdere', 6)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (209, N'Çamlıhemşin', 53)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (210, N'Çamlıyayla', 33)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (211, N'Çamoluk', 28)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (212, N'Çan', 17)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (213, N'Çanakçı', 28)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (214, N'Çanakkale', 17)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (215, N'Çandır', 66)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (216, N'Çankaya', 6)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (217, N'Çankırı', 18)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (218, N'Çardak', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (219, N'Çarşamba', 55)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (220, N'Çarşıbaşı', 61)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (221, N'Çat', 25)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (222, N'Çatak', 65)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (223, N'Çatalca', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (224, N'Çatalpınar', 52)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (225, N'Çatalzeytin', 37)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (226, N'Çavdarhisar', 43)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (227, N'Çavdır', 15)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (228, N'Çay', 3)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (229, N'Çaybaşı', 52)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (230, N'Çaycuma', 67)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (231, N'Çayeli', 53)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (232, N'Çayıralan', 66)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (233, N'Çayırlı', 24)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (234, N'Çayırova', 41)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (235, N'Çaykara', 61)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (236, N'Çekerek', 66)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (237, N'Çekmeköy', 34)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (238, N'Çelebi', 71)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (239, N'Çelikhan', 2)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (240, N'Çeltik', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (241, N'Çeltikçi', 15)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (242, N'Çemişgezek', 62)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (243, N'Çerkeş', 18)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (244, N'Çerkezköy', 59)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (245, N'Çermik', 21)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (246, N'Çeşme', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (247, N'Çıldır', 75)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (248, N'Çınar', 21)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (249, N'Çınarcık', 77)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (250, N'Çiçekdağı', 40)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (251, N'Çifteler', 26)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (252, N'Çiftlik', 51)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (253, N'Çiftlikköy', 77)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (254, N'Çiğli', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (255, N'Çilimli', 81)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (256, N'Çine', 9)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (257, N'Çivril', 20)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (258, N'Çobanlar', 3)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (259, N'Çorlu', 59)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (260, N'Çorum', 19)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (261, N'Çubuk', 6)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (262, N'Çukurca', 30)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (263, N'Çukurova', 1)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (264, N'Çumra', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (265, N'Çüngüş', 21)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (266, N'Daday', 37)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (267, N'Dalaman', 48)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (268, N'Damal', 75)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (269, N'Darende', 44)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (270, N'Dargeçit', 47)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (271, N'Darıca', 41)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (272, N'Datça', 48)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (273, N'Dazkırı', 3)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (274, N'Defne', 31)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (275, N'Delice', 71)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (276, N'Demirci', 45)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (277, N'Demirköy', 39)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (278, N'Demirözü', 69)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (279, N'Demre', 7)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (280, N'Derbent', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (281, N'Derebucak', 42)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (282, N'Dereli', 28)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (283, N'Derepazarı', 53)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (284, N'Derik', 47)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (285, N'Derince', 41)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (286, N'Derinkuyu', 50)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (287, N'Dernekpazarı', 61)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (288, N'Develi', 38)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (289, N'Devrek', 67)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (290, N'Devrekani', 37)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (291, N'Dicle', 21)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (292, N'Didim', 9)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (293, N'Digor', 36)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (294, N'Dikili', 35)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (295, N'Dikmen', 57)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (296, N'Dilovası', 41)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (297, N'Dinar', 3)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (298, N'Divriği', 58)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (299, N'Diyadin', 4)
INSERT [dbo].[ilceler] ([ilce_no], [isim], [il_no]) VALUES (300, N'Dodurga', 19)
GO
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (1, N'Adana', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (2, N'Adıyaman', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (3, N'Afyonkarahisar', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (4, N'Ağrı', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (5, N'Amasya', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (6, N'Ankara', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (7, N'Antalya', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (8, N'Artvin', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (9, N'Aydın', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (10, N'Balıkesir', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (11, N'Bilecik', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (12, N'Bingöl', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (13, N'Bitlis', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (14, N'Bolu', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (15, N'Burdur', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (16, N'Bursa', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (17, N'Çanakkale', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (18, N'Çankırı', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (19, N'Çorum', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (20, N'Denizli', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (21, N'Diyarbakır', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (22, N'Edirne', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (23, N'Elâzığ', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (24, N'Erzincan', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (25, N'Erzurum', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (26, N'Eskişehir', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (27, N'Gaziantep', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (28, N'Giresun', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (29, N'Gümüşhane', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (30, N'Hakkâri', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (31, N'Hatay', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (32, N'Isparta', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (33, N'Mersin', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (34, N'İstanbul', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (35, N'İzmir', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (36, N'Kars', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (37, N'Kastamonu', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (38, N'Kayseri', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (39, N'Kırklareli', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (40, N'Kırşehir', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (41, N'Kocaeli', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (42, N'Konya', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (43, N'Kütahya', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (44, N'Malatya', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (45, N'Manisa', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (46, N'Kahramanmaraş', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (47, N'Mardin', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (48, N'Muğla', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (49, N'Muş', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (50, N'Nevşehir', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (51, N'Niğde', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (52, N'Ordu', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (53, N'Rize', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (54, N'Sakarya', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (55, N'Samsun', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (56, N'Siirt', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (57, N'Sinop', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (58, N'Sivas', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (59, N'Tekirdağ', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (60, N'Tokat', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (61, N'Trabzon', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (62, N'Tunceli', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (63, N'Şanlıurfa', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (64, N'Uşak', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (65, N'Van', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (66, N'Yozgat', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (67, N'Zonguldak', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (68, N'Aksaray', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (69, N'Bayburt', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (70, N'Karaman', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (71, N'Kırıkkale', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (72, N'Batman', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (73, N'Şırnak', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (74, N'Bartın', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (75, N'Ardahan', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (76, N'Iğdır', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (77, N'Yalova', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (78, N'Karabük', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (79, N'Kilis', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (80, N'Osmaniye', NULL, NULL)
INSERT [dbo].[iller] ([il_no], [isim], [FirmaDetayID], [MusteriDetayId]) VALUES (81, N'Düzce', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MusteriDetay] ON 

INSERT [dbo].[MusteriDetay] ([MusteriDetayID], [Adi], [Soyadi], [Adresi], [Telefon], [Email], [İl], [ilce], [MusteriID]) VALUES (1, N'mustafa', N'yıldız', N'Adres', N'5319621482', N'@gmail.com', N'Adıyaman', N'Acıgöl', 10)
INSERT [dbo].[MusteriDetay] ([MusteriDetayID], [Adi], [Soyadi], [Adresi], [Telefon], [Email], [İl], [ilce], [MusteriID]) VALUES (2, N'mert', N'güner', N'A Mahallesi B Caddesi C Sokak No:25/12', N'5326987415', N'guner@gmail.com', N'Burdur', N'Acıgöl', 11)
INSERT [dbo].[MusteriDetay] ([MusteriDetayID], [Adi], [Soyadi], [Adresi], [Telefon], [Email], [İl], [ilce], [MusteriID]) VALUES (3, N'mert', N'güner', N'istanbul', N'052222421', N'mert@mail.com', N'Adana', N'Abana', 1010)
SET IDENTITY_INSERT [dbo].[MusteriDetay] OFF
GO
SET IDENTITY_INSERT [dbo].[MusteriTable] ON 

INSERT [dbo].[MusteriTable] ([MusteriID], [Adi], [sifresi]) VALUES (10, N'yldzmustafa', 123)
INSERT [dbo].[MusteriTable] ([MusteriID], [Adi], [sifresi]) VALUES (11, N'mert', 111)
INSERT [dbo].[MusteriTable] ([MusteriID], [Adi], [sifresi]) VALUES (1010, N'mert', 123)
SET IDENTITY_INSERT [dbo].[MusteriTable] OFF
GO
SET IDENTITY_INSERT [dbo].[Siparis] ON 

INSERT [dbo].[Siparis] ([SatisID], [MusteriID], [FirmaID], [SiparisTarihi], [UrunID], [BetonCesidi], [CimentoCesidi], [KatkiCesidi], [KivamCesidi], [BirimFiyati], [Miktar], [Firma], [SiparisDurumu]) VALUES (3028, 10, 15, CAST(N'2022-02-03' AS Date), 1011, N'c40', N'CEM I', N'Su Tutucu', N'S2', 400.0000, 125, N'Hakan Beton', N'Yola Çıktı')
INSERT [dbo].[Siparis] ([SatisID], [MusteriID], [FirmaID], [SiparisTarihi], [UrunID], [BetonCesidi], [CimentoCesidi], [KatkiCesidi], [KivamCesidi], [BirimFiyati], [Miktar], [Firma], [SiparisDurumu]) VALUES (3029, 1010, 15, CAST(N'2021-01-01' AS Date), 1011, N'c40', N'CEM I', N'Su Azaltıcı/Akışkanlaştırıcı', N'S1', 350.0000, 20, N'Hakan Beton', N'Hazırlanıyor')
INSERT [dbo].[Siparis] ([SatisID], [MusteriID], [FirmaID], [SiparisTarihi], [UrunID], [BetonCesidi], [CimentoCesidi], [KatkiCesidi], [KivamCesidi], [BirimFiyati], [Miktar], [Firma], [SiparisDurumu]) VALUES (3030, 10, 16, CAST(N'2021-01-01' AS Date), 1019, N'c40', N'CEM I', N'Yüksek Oranda Su Azaltıcı/Süper Akışkanlaştırıcı', N'S1', 350.0000, 125, N'albayrak', N'Sipariş Alındı')
SET IDENTITY_INSERT [dbo].[Siparis] OFF
GO
SET IDENTITY_INSERT [dbo].[SiparisTablosu] ON 

INSERT [dbo].[SiparisTablosu] ([SiparisID], [BetonCesidi], [CimentoCesidi], [KatkiCesidi], [KivamCesidi], [SiparisTarihi], [BirimFiyat], [Miktar], [Firma]) VALUES (13, N'c30', N'CEM I', N'Su Azaltıcı/Akışkanlaştırıcı', N'S1', CAST(N'2022-01-01' AS Date), 300.0000, 2354, N'Hakan Beton')
SET IDENTITY_INSERT [dbo].[SiparisTablosu] OFF
GO
SET IDENTITY_INSERT [dbo].[SiparisTakibi] ON 

INSERT [dbo].[SiparisTakibi] ([TakipID], [Durum]) VALUES (1, N'Sipariş Alındı')
INSERT [dbo].[SiparisTakibi] ([TakipID], [Durum]) VALUES (2, N'Sipariş Hazırlanıyor')
INSERT [dbo].[SiparisTakibi] ([TakipID], [Durum]) VALUES (3, N'Yola Çıktı')
INSERT [dbo].[SiparisTakibi] ([TakipID], [Durum]) VALUES (4, N'Teslim Alındı')
SET IDENTITY_INSERT [dbo].[SiparisTakibi] OFF
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [FirmaID], [BirimFiyat], [Stok]) VALUES (1011, N'c40', 15, 562.0000, N'Var       ')
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [FirmaID], [BirimFiyat], [Stok]) VALUES (1013, N'c35', 15, 350.0000, N'Var       ')
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [FirmaID], [BirimFiyat], [Stok]) VALUES (1014, N'c25', 15, 355.0000, N'Var       ')
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [FirmaID], [BirimFiyat], [Stok]) VALUES (1015, N'c55', 15, 450.0000, N'Yok       ')
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [FirmaID], [BirimFiyat], [Stok]) VALUES (1018, N'c35', 16, 300.0000, N'Yok       ')
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [FirmaID], [BirimFiyat], [Stok]) VALUES (1019, N'c40', 16, 400.0000, N'Var       ')
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [FirmaID], [BirimFiyat], [Stok]) VALUES (1020, N'c40', 18, 350.0000, N'Var       ')
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [FirmaID], [BirimFiyat], [Stok]) VALUES (1022, N'c25', 18, 250.0000, N'Yok       ')
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [FirmaID], [BirimFiyat], [Stok]) VALUES (1023, N'c55', 16, 400.0000, N'Var       ')
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
ALTER TABLE [dbo].[Bildirim]  WITH CHECK ADD  CONSTRAINT [FK_Bildirim_FirmaTable] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaTable] ([FirmaID])
GO
ALTER TABLE [dbo].[Bildirim] CHECK CONSTRAINT [FK_Bildirim_FirmaTable]
GO
ALTER TABLE [dbo].[Fatura]  WITH CHECK ADD  CONSTRAINT [FK_Fatura_Siparis] FOREIGN KEY([Faturaid])
REFERENCES [dbo].[Siparis] ([SatisID])
GO
ALTER TABLE [dbo].[Fatura] CHECK CONSTRAINT [FK_Fatura_Siparis]
GO
ALTER TABLE [dbo].[FaturaDetay]  WITH CHECK ADD  CONSTRAINT [FK_FaturaDetay_Fatura] FOREIGN KEY([FaturaDetayID])
REFERENCES [dbo].[Fatura] ([Faturaid])
GO
ALTER TABLE [dbo].[FaturaDetay] CHECK CONSTRAINT [FK_FaturaDetay_Fatura]
GO
ALTER TABLE [dbo].[Favoriler]  WITH CHECK ADD  CONSTRAINT [FK_Favoriler_FirmaTable1] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaTable] ([FirmaID])
GO
ALTER TABLE [dbo].[Favoriler] CHECK CONSTRAINT [FK_Favoriler_FirmaTable1]
GO
ALTER TABLE [dbo].[Favoriler]  WITH CHECK ADD  CONSTRAINT [FK_Favoriler_MusteriTable] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[MusteriTable] ([MusteriID])
GO
ALTER TABLE [dbo].[Favoriler] CHECK CONSTRAINT [FK_Favoriler_MusteriTable]
GO
ALTER TABLE [dbo].[FirmaDetay]  WITH CHECK ADD  CONSTRAINT [FK_FirmaDetay_FirmaTable] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaTable] ([FirmaID])
GO
ALTER TABLE [dbo].[FirmaDetay] CHECK CONSTRAINT [FK_FirmaDetay_FirmaTable]
GO
ALTER TABLE [dbo].[FirmaPersonel]  WITH CHECK ADD  CONSTRAINT [FK_FirmaPersonel_FirmaTable] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaTable] ([FirmaID])
GO
ALTER TABLE [dbo].[FirmaPersonel] CHECK CONSTRAINT [FK_FirmaPersonel_FirmaTable]
GO
ALTER TABLE [dbo].[FirmaPersonel]  WITH CHECK ADD  CONSTRAINT [FK_FirmaPersonel_Siparis] FOREIGN KEY([SiparisID])
REFERENCES [dbo].[Siparis] ([SatisID])
GO
ALTER TABLE [dbo].[FirmaPersonel] CHECK CONSTRAINT [FK_FirmaPersonel_Siparis]
GO
ALTER TABLE [dbo].[ilceler]  WITH CHECK ADD  CONSTRAINT [fk_il_no] FOREIGN KEY([il_no])
REFERENCES [dbo].[iller] ([il_no])
GO
ALTER TABLE [dbo].[ilceler] CHECK CONSTRAINT [fk_il_no]
GO
ALTER TABLE [dbo].[iller]  WITH CHECK ADD  CONSTRAINT [FK_iller_FirmaDetay] FOREIGN KEY([FirmaDetayID])
REFERENCES [dbo].[FirmaDetay] ([KKDetayID])
GO
ALTER TABLE [dbo].[iller] CHECK CONSTRAINT [FK_iller_FirmaDetay]
GO
ALTER TABLE [dbo].[iller]  WITH CHECK ADD  CONSTRAINT [FK_iller_MusteriDetay] FOREIGN KEY([MusteriDetayId])
REFERENCES [dbo].[MusteriDetay] ([MusteriDetayID])
GO
ALTER TABLE [dbo].[iller] CHECK CONSTRAINT [FK_iller_MusteriDetay]
GO
ALTER TABLE [dbo].[İnsanKaynaklari]  WITH CHECK ADD  CONSTRAINT [FK_İnsanKaynaklari_FirmaTable] FOREIGN KEY([InsanKayID])
REFERENCES [dbo].[FirmaTable] ([FirmaID])
GO
ALTER TABLE [dbo].[İnsanKaynaklari] CHECK CONSTRAINT [FK_İnsanKaynaklari_FirmaTable]
GO
ALTER TABLE [dbo].[MikserDurum]  WITH CHECK ADD  CONSTRAINT [FK_MikserDurum_FirmaTable] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaTable] ([FirmaID])
GO
ALTER TABLE [dbo].[MikserDurum] CHECK CONSTRAINT [FK_MikserDurum_FirmaTable]
GO
ALTER TABLE [dbo].[Muhasebe]  WITH CHECK ADD  CONSTRAINT [FK_Muhasebe_FirmaTable] FOREIGN KEY([MuhasebeID])
REFERENCES [dbo].[FirmaTable] ([FirmaID])
GO
ALTER TABLE [dbo].[Muhasebe] CHECK CONSTRAINT [FK_Muhasebe_FirmaTable]
GO
ALTER TABLE [dbo].[Muhasebeci]  WITH CHECK ADD  CONSTRAINT [FK_Muhasebeci_Muhasebe] FOREIGN KEY([MuhasebeID])
REFERENCES [dbo].[Muhasebe] ([MuhasebeID])
GO
ALTER TABLE [dbo].[Muhasebeci] CHECK CONSTRAINT [FK_Muhasebeci_Muhasebe]
GO
ALTER TABLE [dbo].[MusteriDetay]  WITH CHECK ADD  CONSTRAINT [FK_MusteriDetay_MusteriTable] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[MusteriTable] ([MusteriID])
GO
ALTER TABLE [dbo].[MusteriDetay] CHECK CONSTRAINT [FK_MusteriDetay_MusteriTable]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_MusteriTable] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[MusteriTable] ([MusteriID])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_MusteriTable]
GO
ALTER TABLE [dbo].[Siparis]  WITH CHECK ADD  CONSTRAINT [FK_Siparis_Urunler] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunID])
GO
ALTER TABLE [dbo].[Siparis] CHECK CONSTRAINT [FK_Siparis_Urunler]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_FirmaTable] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaTable] ([FirmaID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_FirmaTable]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_MusteriTable] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[MusteriTable] ([MusteriID])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_MusteriTable]
GO
/****** Object:  StoredProcedure [dbo].[favoriekle]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[favoriekle]
(
    @firmaid int null,
	@musteriid int null,
    @id int out
)
as begin
if(exists(select FirmaID from Favoriler where FirmaID=@firmaid and MusteriID=@musteriid))
select @id=1
else
insert into Favoriler
values(@firmaid,@musteriid)
end
GO
/****** Object:  StoredProcedure [dbo].[favorilistelee]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[favorilistelee]
(
	@id int null
)
as begin
select * from Favoriler f inner join MusteriTable mt on f.MusteriID=mt.MusteriID
inner join FirmaTable ft on f.FirmaID=ft.FirmaID
inner join FirmaDetay fd on fd.FirmaID=f.FirmaID
where f.MusteriID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[favorisil]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[favorisil]
(
    @firmaid int null
)
as begin
delete from Favoriler where FirmaID=@firmaid
end
GO
/****** Object:  StoredProcedure [dbo].[FirmaArama]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FirmaArama]
@Aramametni nvarchar(50)
as begin
select fd.FirmaID, fd.FirmaAdi, fd.İl, fd.İlçe, fd.Telefon, fd.Email,fd.Hakkinda from FirmaTable fb inner join 
FirmaDetay fd on fb.FirmaID=fd.FirmaID
where (@Aramametni = '' or fd.FirmaAdi like '%'+@Aramametni + '%') 
end
GO
/****** Object:  StoredProcedure [dbo].[firmabilgileriduzenle]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[firmabilgileriduzenle]
(
	@firmaAdi nvarchar(50) null,
	@firmatel nvarchar(11) null,
	@firmaEmail nvarchar(50) null,
	@firmail nvarchar(50) null,
	@firmailce nvarchar(50) null,
	@id int 
)
as begin
update FirmaDetay
set FirmaAdi=@firmaAdi, İl=@firmail, İlçe=@firmailce,Telefon=@firmatel,Email=@firmaEmail
where FirmaID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[firmagirisbilgileriduzenle]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[firmagirisbilgileriduzenle]
(
	@firmakullaniciadi nvarchar(50) null,
	@firmasifre nvarchar(11) null,
	@id int 
)
as begin
update FirmaTable
set Adi=@firmakullaniciadi, Sifresi=@firmasifre
where FirmaID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[firmagirisi]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[firmagirisi]
(
	@kullaniciadi nvarchar(50) null,
	@sifresi int null,
	@id int out
)
as begin
if(not exists(select Adi from FirmaTable where @kullaniciadi=Adi and @sifresi=Sifresi))
select @id=0
else 
select @id=FirmaID from FirmaTable where @kullaniciadi=Adi and @sifresi=Sifresi
end
GO
/****** Object:  StoredProcedure [dbo].[firmayagoreurungetir]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[firmayagoreurungetir]
(
	@id int null
)
as begin
select UrunAdi from Urunler where FirmaID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[kullanicibilgileriduzenle]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[kullanicibilgileriduzenle]
(
	@ad nvarchar(50) null,
	@soyad nvarchar(50) null,
	@il nvarchar(50) null,
	@ilce nvarchar(50) null,
	@tel nvarchar(50) null,
	@mail nvarchar(50) null,
	@adres nvarchar(max) null,
	@id int
)
as begin
update MusteriDetay
set Adi=@ad, Soyadi=@soyad, İl=@il, ilce=@ilce, Telefon=@tel, Email=@mail,Adresi=@adres
where MusteriID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[kullanicigirisbilgileriduzenle]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[kullanicigirisbilgileriduzenle]
(
	@kullaniciadi nvarchar(50) null,
	@kullanicisifresi nvarchar(50) null,
	@id int
)
as begin
update MusteriTable
set Adi=@kullaniciadi, sifresi=@kullanicisifresi
where MusteriID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[kullanicigirisi]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[kullanicigirisi]
(
    @kullaniciadi nvarchar(50) null,
    @sifre int null,
    @id int out
)
as begin
if(not exists(select Adi from MusteriTable where @kullaniciadi=Adi and @sifre=sifresi))
select @id=0
else 
select @id=MusteriID from MusteriTable where @kullaniciadi=Adi and @sifre=Sifresi
end
GO
/****** Object:  StoredProcedure [dbo].[kullanicikayit]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[kullanicikayit]
(
	@adi nvarchar(50) null,
	@soyadi nvarchar(50) null,
	@il nvarchar(50) null,
	@ilce nvarchar(50) null,
	@tel nvarchar(11) null,
	@email nvarchar(50) null,
	@adresi nvarchar(max) null,
	@id int out
)
as begin
declare @Sonidd int 
select @Sonidd=IDENT_CURRENT('MusteriTable')
insert into MusteriDetay
values(@adi,@soyadi,@adresi,@tel,@email,@il,@ilce,@Sonidd)
select @id=1
end
GO
/****** Object:  StoredProcedure [dbo].[kullaniciuyeol]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[kullaniciuyeol]
(
    @kullaniciadi nvarchar(50) null,
    @sifre int null,
    @id int out
)
as begin
if(exists(select Adi from MusteriTable where @kullaniciadi=Adi and @sifre=sifresi))
select @id=1
else
insert into MusteriTable(Adi,sifresi)
values(@kullaniciadi,@sifre)
end
GO
/****** Object:  StoredProcedure [dbo].[siparisdurumuguncelle]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[siparisdurumuguncelle]
(
    @siparisdurum nvarchar(50) null,
    @id int null
)
as
update Siparis set SiparisDurumu=@siparisdurum where SatisID=@id
GO
/****** Object:  StoredProcedure [dbo].[SiparisEkle]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SiparisEkle]
(
	@musteriid int null,
	@betoncesidi nvarchar(50) null,
	@cimentocesidi nvarchar(50) null,
	@katkicesidi nvarchar(50) null,
	@kivamcesidi nvarchar(50) null,
	@siparistarihi date null,
	@miktar bigint null,
	@firmaid int null,
	@siparisdurumu nvarchar(50) null
)
as begin
declare @FirmaAdi nvarchar(50)
select @FirmaAdi=f.FirmaAdi from FirmaDetay f where FirmaID=@firmaid

declare @Fiyat money
select @Fiyat=BirimFiyat from Urunler where UrunAdi=@betoncesidi

declare @urunid int
select @urunid=UrunID from Urunler where UrunAdi=@betoncesidi and FirmaID=@firmaid


insert into Siparis
values(@musteriid,@firmaid,@siparistarihi,@urunid,@betoncesidi,@cimentocesidi,@katkicesidi,@kivamcesidi,@Fiyat,@miktar,@FirmaAdi,@siparisdurumu)
end
GO
/****** Object:  StoredProcedure [dbo].[siparisEklee]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[siparisEklee]
(
    @musteriid int null,
    @firmaid int null,
    @siparistarihi date null,
    @urunid int null,
    @betoncesidi nvarchar(50) null,
    @cimentocesidi nvarchar(50) null,
    @katkicesidi nvarchar(50) null,
    @kivamcesidi nvarchar(50) null,
    @birimfiyati money null,
    @miktar bigint null
)
as begin
insert into Siparis(MusteriID,FirmaID,SiparisTarihi,UrunID,BetonCesidi,CimentoCesidi,KatkiCesidi,KivamCesidi,BirimFiyati,Miktar)
values(@musteriid, @firmaid, @siparistarihi, @urunid,@betoncesidi,@cimentocesidi,@katkicesidi,@kivamcesidi,@birimfiyati,@miktar)
end
GO
/****** Object:  StoredProcedure [dbo].[siparislistele]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[siparislistele]
(
	@id int null
)
as
begin 
select * from Siparis where MusteriID=@id 
end
GO
/****** Object:  StoredProcedure [dbo].[urunEkle]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[urunEkle]
(
    @urunadi nvarchar(50) null,
    @birimfiyati money null,
    @stok nchar(10) null,
	@firmaid int
)
as begin
insert into Urunler(UrunAdi,BirimFiyat,Stok,FirmaID)
values(@urunadi,@birimfiyati,@stok,@firmaid)
end
GO
/****** Object:  StoredProcedure [dbo].[urunGuncelle]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[urunGuncelle]
(
    @id int null,
    @urunadi nvarchar(50) null,
    @birimfiyati money null,
    @stok nchar(10) null
)
as begin
update Urunler
set UrunAdi=@urunadi, BirimFiyat=@birimfiyati,Stok=@stok
where UrunID=@id;
end
GO
/****** Object:  StoredProcedure [dbo].[urunListele]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[urunListele]
(
	@firmaid int null
)
as begin
select * from Urunler where FirmaID=@firmaid 
end
GO
/****** Object:  StoredProcedure [dbo].[urunSil]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[urunSil]
(
    @id int null,
	@betonadi nvarchar(50) null
)
as begin
delete from Urunler where UrunID=@id
delete from Siparis where UrunID=@id and BetonCesidi=@betonadi
end
GO
/****** Object:  StoredProcedure [dbo].[uyeol]    Script Date: 12.04.2022 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uyeol]
(
	@kullaniciadi nvarchar(50) null,
	@sifresi int null,
	@id int out
)
as begin
if(exists(select Adi from FirmaTable where @kullaniciadi=Adi and @sifresi=Sifresi))
select @id=1
else
insert into FirmaTable(Adi,Sifresi)
values(@kullaniciadi,@sifresi)
end
GO
