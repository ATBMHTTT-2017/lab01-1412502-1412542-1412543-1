create table ALab1_NhanVien
(
  MaNV char(5) primary key,
  HoTen varchar2(31 char),
  DienThoai varchar2(11 char),
  Email varchar2(50 char),
  DiaChi varchar2(50 char),
  Luong int,
  Phong char(2),
  ChiNhanh int
);


create table ALab1_PhongBan
(
  MaPhong char(2) primary key,
  TenPhong varchar2(30 char),
  TruongPhong char(5),
  NgayNhanChuc date,
  SoNhanVien int,
  ChiNhanh int
);

create table ALab1_ChiNhanh
(
  MaCN int primary key,
  TenCN varchar2(30 char),
  TruongChiNhanh char(5)
);

create table ALab1_DuAn
(
  MaDA char(3) primary key, 
  TenDA varchar2(30 char),
  KinhPhi int,
  PhongChuTri char(2),
  TruongDA char(5)
);

create table ALab1_PhanCong
(
  MaNV char(5) not null,
  DuAn char(3) not null,
  VaiTro varchar2(30 char),
  PhuCap int,
  constraint PK_PhanCong primary key (MaNV, DuAn)
);

create table ALab1_ChiTieu
(
  MaChiTieu int primary key,
  TenChiTieu varchar2(50 char),
  SoTien int,
  DuAn char(3)
);

-- Oracle khong cho update primary key nen khong the cai dat " on update cascade"

alter table ALab1_NhanVien add
  constraint FK_NhanVien_Phong foreign key (Phong) references ALab1_PhongBan(MaPhong) ON DELETE set null;
alter table ALab1_NhanVien add
  constraint FK_NhanVien_ChiNhanh foreign key (ChiNhanh) references ALab1_ChiNhanh(MaCN) on delete set null;

alter table ALab1_PhongBan add
  constraint FK_PhongBan_NhanVien foreign key (TruongPhong) references ALab1_NhanVien(MaNV) on delete set null;
alter table ALab1_PhongBan add
  constraint FK_PhongBan_ChiNhanh foreign key (ChiNhanh) references ALab1_ChiNhanh(MaCN) on delete set null;

alter table ALab1_ChiNhanh add
  constraint FK_ChiNhanh_NhanVien foreign key (TruongChiNhanh) references ALab1_NhanVien(MaNV) on delete set null;
  
alter table ALab1_DuAn add
  constraint FK_DuAn_PhongBan foreign key(PhongChuTri) references ALab1_PhongBan(MaPhong) on delete set null;
alter table ALab1_DuAn add
  constraint FK_DuAn_NhanVien foreign key(TruongDA) references ALab1_NhanVien(MaNV) on delete set null;

alter table ALab1_PhanCong add
  constraint FK_PhanCong_DuAn foreign key (DuAn) references ALab1_DuAn(MaDA)  on delete cascade;
alter table ALab1_PhanCong add
  constraint FK_PhanCong_NhanVien foreign key (MaNV) references ALab1_NhanVien(MaNV)  on delete cascade;
  
alter table ALab1_ChiTieu add
  constraint FK_ChiTieu_DuAn foreign key (DuAn) references ALab1_DuAn(MaDA) on delete cascade;



