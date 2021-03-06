USE [QLBH]
GO
/****** Object:  Table [dbo].[CTPhieuNhap]    Script Date: 13/05/2019 1:44:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuNhap](
	[MaPN] [int] NOT NULL,
	[MaCTSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Gia] [money] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_CTPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[MaCTSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTQuyenChucVu]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTQuyenChucVu](
	[MaQuyen] [int] NOT NULL,
	[MaCV] [int] NOT NULL,
 CONSTRAINT [PK_CTQuyenChucVu] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC,
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTSanPham]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTSanPham](
	[MaCTSP] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[MaMau] [int] NULL,
	[MaKC] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK__CTSanPha__1E4FCECDCD5E3A64] PRIMARY KEY CLUSTERED 
(
	[MaCTSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTHoaDon]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDon](
	[MaHD] [int] NOT NULL,
	[MaCTSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Gia] [money] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_CTHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaCTSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [int] IDENTITY(1,1) NOT NULL,
	[TenCV] [varchar](100) NULL,
 CONSTRAINT [PK__ChucVu__27258E76B2D5C751] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayLap] [datetime] NULL,
	[ThanhTien] [money] NULL,
	[Thue] [money] NULL,
	[MaNV] [int] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK__HoaDon__2725A6E032826E64] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KichCoSP]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KichCoSP](
	[MaKC] [int] IDENTITY(1,1) NOT NULL,
	[TenKC] [varchar](100) NULL,
 CONSTRAINT [PK__KichCoSP__2725CF03ADDF0FCD] PRIMARY KEY CLUSTERED 
(
	[MaKC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [ntext] NULL,
	[DiaChi] [ntext] NULL,
	[GioiTinh] [bit] NULL,
	[CMND] [char](12) NULL,
	[NgaySinh] [date] NULL,
	[Diem] [int] NULL,
	[SDT] [char](12) NULL,
 CONSTRAINT [PK__KhachHan__2725CF1E29CBDD60] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLSP] [varchar](100) NULL,
	[DonVi] [varchar](100) NULL,
 CONSTRAINT [PK__LoaiSanP__3B983FFE7C69F778] PRIMARY KEY CLUSTERED 
(
	[MaLSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MauSP]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MauSP](
	[MaMau] [int] IDENTITY(1,1) NOT NULL,
	[TenMau] [varchar](100) NULL,
 CONSTRAINT [PK__MauSP__3A5BBB7D9158F7A9] PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [varchar](100) NULL,
	[DiaChi] [ntext] NULL,
	[SDT] [char](12) NULL,
 CONSTRAINT [PK__NhaCungC__3A185DEB3B00BD70] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](100) NULL,
	[Taikhoan] [varchar](32) NULL,
	[Matkhau] [varchar](32) NULL,
	[DiaChi] [ntext] NULL,
	[GioiTinh] [bit] NULL,
	[CMND] [char](12) NULL,
	[NgaySinh] [date] NULL,
	[Luong] [int] NULL,
	[GiaNhap] [datetime] NULL CONSTRAINT [DF__NhanVien__GiaNha__1B0907CE]  DEFAULT (getdate()),
	[MaCV] [int] NULL,
	[SDT] [char](12) NULL,
	[Xoa] [bit] NULL CONSTRAINT [DF_NhanVien_Xoa]  DEFAULT ((0)),
 CONSTRAINT [PK__NhanVien__2725D70ABFEA06E5] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[NgayLap] [datetime] NULL,
	[ThanhTien] [money] NULL,
	[Thue] [money] NULL,
	[TrangThai] [bit] NULL,
	[MaNV] [int] NULL,
	[MaNCC] [int] NULL,
 CONSTRAINT [PK__PhieuNha__2725E7F009D450E0] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyenHeThong]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuyenHeThong](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [varchar](100) NULL,
 CONSTRAINT [PK__QuyenHeT__1D4B7ED4B4BFF83E] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [varchar](100) NULL,
	[Gia] [money] NULL,
	[MaLSP] [int] NULL,
 CONSTRAINT [PK__SanPham__2725081CB76BE509] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChucVu] ON 

INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (1, N'Admin')
SET IDENTITY_INSERT [dbo].[ChucVu] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [Taikhoan], [Matkhau], [DiaChi], [GioiTinh], [CMND], [NgaySinh], [Luong], [GiaNhap], [MaCV], [SDT], [Xoa]) VALUES (2, N'test', N'test', N'1234', N'abc', 0, N'123456789   ', CAST(N'2019-05-12' AS Date), 1000, CAST(N'2019-05-12 01:54:21.137' AS DateTime), NULL, N'0123        ', 0)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF__HoaDon__NgayLap__1DE57479]  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF__KhachHang__Diem__182C9B23]  DEFAULT ((0)) FOR [Diem]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF__PhieuNhap__NgayL__20C1E124]  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhap_CTSanPham] FOREIGN KEY([MaCTSP])
REFERENCES [dbo].[CTSanPham] ([MaCTSP])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK_CTPhieuNhap_CTSanPham]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhap_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK_CTPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[CTQuyenChucVu]  WITH CHECK ADD  CONSTRAINT [FK_CTQuyenChucVu_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[CTQuyenChucVu] CHECK CONSTRAINT [FK_CTQuyenChucVu_ChucVu]
GO
ALTER TABLE [dbo].[CTQuyenChucVu]  WITH CHECK ADD  CONSTRAINT [FK_CTQuyenChucVu_QuyenHeThong] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QuyenHeThong] ([MaQuyen])
GO
ALTER TABLE [dbo].[CTQuyenChucVu] CHECK CONSTRAINT [FK_CTQuyenChucVu_QuyenHeThong]
GO
ALTER TABLE [dbo].[CTSanPham]  WITH CHECK ADD  CONSTRAINT [FK_CTSanPham_KichCoSP] FOREIGN KEY([MaKC])
REFERENCES [dbo].[KichCoSP] ([MaKC])
GO
ALTER TABLE [dbo].[CTSanPham] CHECK CONSTRAINT [FK_CTSanPham_KichCoSP]
GO
ALTER TABLE [dbo].[CTSanPham]  WITH CHECK ADD  CONSTRAINT [FK_CTSanPham_MauSP] FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSP] ([MaMau])
GO
ALTER TABLE [dbo].[CTSanPham] CHECK CONSTRAINT [FK_CTSanPham_MauSP]
GO
ALTER TABLE [dbo].[CTSanPham]  WITH CHECK ADD  CONSTRAINT [FK_CTSanPham_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTSanPham] CHECK CONSTRAINT [FK_CTSanPham_SanPham]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_CTSanPham] FOREIGN KEY([MaCTSP])
REFERENCES [dbo].[CTSanPham] ([MaCTSP])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_CTSanPham]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
/****** Object:  StoredProcedure [dbo].[SuaNhanVien]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SuaNhanVien] (
	@ma int,
	@ten nvarchar(100),
	@taikhoan varchar(32),
	@matkhau varchar(32),
	@diachi ntext,
	@gioitinh bit,
	@cmnd varchar(12),
	@sdt char(12),
	@ngaysinh date,
	@luong int,
	@chucvu int)
as
	begin
		update NhanVien
		set
			TenNV = @ten,
			Taikhoan = @taikhoan,
			Matkhau = @matkhau,
			DiaChi = @diachi,
			GioiTinh = @gioitinh,
			CMND = @cmnd,
			SDT = @sdt,
			NgaySinh = @ngaysinh,
			luong =@luong,
			MaCV = @chucvu
		where
			MaNV = @ma
	end
GO
/****** Object:  StoredProcedure [dbo].[ThemNhanVien]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ThemNhanVien] (
	@ten nvarchar(100),
	@taikhoan varchar(32),
	@matkhau varchar(32),
	@diachi ntext,
	@gioitinh bit,
	@cmnd varchar(12),
	@sdt char(12),
	@ngaysinh date,
	@luong int,
	@chucvu int)
as
	begin
		insert into NhanVien(TenNV, Taikhoan, Matkhau, DiaChi, GioiTinh, CMND, SDT, NgaySinh, Luong, MaCV)
		values (
			@ten, @taikhoan, @matkhau, @diachi, @gioitinh, @cmnd, @sdt, @ngaysinh, @luong, @chucvu
		)

	end
GO
/****** Object:  StoredProcedure [dbo].[XoaNhanVien]    Script Date: 13/05/2019 1:44:05 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaNhanVien](@ma int)
as
	begin
		update nhanvien
		set
			Xoa = 1
		where
			MaNV = @ma
		
	end
GO
