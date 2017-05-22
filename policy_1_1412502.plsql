create table NhanVien
(
  MaNV char(5) primary key,
  HoTen varchar2(31 char),
  DienThoai varchar2(11 char),
  Email varchar2(50 char),
  DiaChi varchar2(50 char),
  Luong int,
  Phong char(3),
  ChiNhanh int,
  ChucVu numeric(1,0) default 0
) ;

create table PhongBan
(
  MaPhong char(3) primary key,
  TenPhong varchar2(30 char),
  TruongPhong char(5),
  NgayNhanChuc date,
  SoNhanVien int,
  ChiNhanh int
);

create table ChiNhanh
(
  MaCN int primary key,
  TenCN varchar2(30 char),
  TruongChiNhanh char(5)
);

create table DuAn
(
  MaDA char(3) primary key, 
  TenDA varchar2(30 char),
  KinhPhi int,
  PhongChuTri char(3),
  TruongDA char(5)
);

create table PhanCong
(
  MaNV char(5) not null,
  DuAn char(3) not null,
  VaiTro varchar2(30 char),
  PhuCap int,
  constraint PK_PhanCong1 primary key (MaNV, DuAn)
);

create table ChiTieu
(
  MaChiTieu int primary key,
  TenChiTieu varchar2(50 char),
  SoTien int,
  DuAn char(3)
);

-- Oracle khong cho update primary key nen khong the cai dat " on update cascade"

alter table NhanVien add
  constraint FK_NhanVien_Phong foreign key (Phong) references PhongBan(MaPhong) ON DELETE set null;
alter table NhanVien add
  constraint FK_NhanVien_ChiNhanh foreign key (ChiNhanh) references ChiNhanh(MaCN) on delete set null;

alter table PhongBan add
  constraint FK_PhongBan_NhanVien foreign key (TruongPhong) references NhanVien(MaNV) on delete set null;
alter table PhongBan add
  constraint FK_PhongBan_ChiNhanh foreign key (ChiNhanh) references ChiNhanh(MaCN) on delete set null;

alter table ChiNhanh add
  constraint FK_ChiNhanh_NhanVien foreign key (TruongChiNhanh) references NhanVien(MaNV) on delete set null;
  
alter table DuAn add
  constraint FK_DuAn_PhongBan foreign key(PhongChuTri) references PhongBan(MaPhong) on delete set null;
alter table DuAn add
  constraint FK_DuAn_NhanVien foreign key(TruongDA) references NhanVien(MaNV) on delete set null;

alter table PhanCong add
  constraint FK_PhanCong_DuAn foreign key (DuAn) references DuAn(MaDA)  on delete cascade;
alter table PhanCong add
  constraint FK_PhanCong_NhanVien foreign key (MaNV) references NhanVien(MaNV)  on delete cascade;
  
alter table ChiTieu add
  constraint FK_ChiTieu_DuAn foreign key (DuAn) references DuAn(MaDA) on delete cascade;