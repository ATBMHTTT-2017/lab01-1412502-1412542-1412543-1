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
-- Oracle khong cho update primary key nen khong the cai dat " on update cascade"

insert into ChiNhanh values(1, 'Main branch', null); 
insert into ChiNhanh values(2, 'TP Ho Chi Minh', null);
insert into ChiNhanh values(3, 'Da Nang', null);
insert into chinhanh values(4, 'Hai Phong', null);
insert into chinhanh values(5, 'Ha Noi', null); 

--------------------------------------------------------------------------------------------------------------------------------------------

insert into phongban values ('NS1', 'Human resources', null, null, 5, 1);
insert into phongban values ('KH1', 'Planning', null, null, 5,1);
insert into phongban values ('KT1', 'Accounting', null, null,3,1); 

insert into PhongBan values ('NS2', 'Human resources HCM', null, null,2, 2);
insert into PhongBan values ('KH2', 'Planning HCM', null, null, 4, 2);
insert into PhongBan values ('KT2', 'Accounting HCM', null, null, 2, 2);

insert into PhongBan values ('NS3', 'Human resources DN', null, null,2, 3);
insert into PhongBan values ('KH3', 'Planning DN', null, null, 4, 3);
insert into PhongBan values ('KT3', 'Accounting DN', null, null, 2, 3);

insert into PhongBan values ('NS4', 'Human resources HP', null, null,2, 4);
insert into PhongBan values ('KH4', 'Planning HP', null, null, 4,4);
insert into PhongBan values ('KT4', 'Accounting HP', null, null, 2,4);

insert into phongban values ('NS5', 'Human resources HN', null, null, 2,5);
insert into phongban values ('KH5', 'Planning HN', null, null, 4,5);
insert into PhongBan values ('KT5', 'Accounting HN', null, null, 2,5);

--------------------------------------------------------------------------------------------------------------------------------------------

-- trưởng phòng
insert into NHANVIEN VALUES('NV001', 'ALICE', '0901234567', 'nv001@gmail.com', 'HCM', 3000,'NS1',1);
insert into NHANVIEN VALUES('NV002', 'ALEX', '0903234567', 'nv002@gmail.com', 'HCM', 3000,'NS2',2);
insert into NHANVIEN VALUES('NV003', 'FAY', '0903234587', 'nv003@gmail.com', 'HCM', 3000,'NS3',3);
insert into NHANVIEN VALUES('NV004', 'KATY', '0903234567', 'nv004@gmail.com', 'HCM', 3000,'NS4',4);
insert into NHANVIEN VALUES('NV005', 'JOHN', '0903284567', 'nv005@gmail.com', 'HCM', 3000,'NS5',5);

insert into NHANVIEN VALUES('NV006', 'SIMON', '0903234867', 'nv006@gmail.com', 'HCM', 3000,'KH1',1);
insert into NHANVIEN VALUES('NV007', 'AMY', '0903234897', 'nv007@gmail.com', 'HCM', 3000,'KH2',2);
insert into NHANVIEN VALUES('NV008', 'SOPHIA', '0906234867', 'nv008@gmail.com', 'HCM', 3000,'KH3',3);
insert into NHANVIEN VALUES('NV009', 'HAARY', '0901234567', 'nv009@gmail.com', 'Hue', 3000,'KH4',4);
insert into NHANVIEN VALUES('NV010', 'ADAM', '0903237567', 'nv010@gmail.com', 'Ca Mau', 3000,'KH5',5);

insert into NHANVIEN VALUES('NV011', 'LIAM', '0903235587', 'nv011@gmail.com', 'Long An', 3000,'KT1',1);
insert into NHANVIEN VALUES('NV012', 'ANNA', '0903234167', 'nv012@gmail.com', 'Tien Giang', 3000,'KT2',2);
insert into NHANVIEN VALUES('NV013', 'ISAAC', '0903280567', 'nv013gmail.com', 'Ha Noi', 3000,'KT3',3);
insert into NHANVIEN VALUES('NV014', 'JACKSON', '0903434867', 'nv014@gmail.com', 'Hue', 3000,'KT4',4);
insert into NHANVIEN VALUES('NV015', 'KEY', '0903234697', 'nv015@gmail.com', 'Buon Me Thuoc', 3000,'KT5',5);

-- TRƯỞNG CHI NHÿNH
insert into NHANVIEN VALUES('NV016', 'ELLA', '0906238337', 'nv016@gmail.com', 'Lao Cao', 4000,NULL,1);
insert into NHANVIEN VALUES('NV017', 'LILY', '0903234697', 'nv017@gmail.com', 'Ha Tinh', 4000,NULL,2);
insert into NHANVIEN VALUES('NV018', 'JOLIE', '0903235697', 'nv018@gmail.com', 'Nghe An', 4000,NULL,3);
insert into NHANVIEN VALUES('NV019', 'DANIEL', '0933234697', 'nv019@gmail.com', 'Thanh Hoa', 4000,NULL,4);
insert into NHANVIEN VALUES('NV020', 'WILLIAM', '0903235486', 'nv020@gmail.com', 'Hai Duong', 4000,NULL,5);

-- TRƯỞNG DỰ ÿN
insert into NHANVIEN VALUES('NV021', 'BLAKE', '0903842697', 'nv02@gmail.com', 'Quang Ngai', 2500,'KH1',1);
insert into NHANVIEN VALUES('NV022', 'KRIS', '0916734697', 'nv022@gmail.com', 'Binh Dinh', 2500,'KH2',2);
insert into NHANVIEN VALUES('NV023', 'JENNIFER', '0903852697', 'nv023@gmail.com', 'Quang Nam', 2500,'KH3',3);
insert into NHANVIEN VALUES('NV024', 'VICTORIA', '0903237539', 'nv024@gmail.com', 'Dong Nai', 2500,'KH4',4);
insert into NHANVIEN VALUES('NV025', 'KAI', '0903234269', 'nv025@gmail.com', 'Vinh Long', 2500,'KH5',5);

-- NHÂN VIÊN
insert into NHANVIEN VALUES('NV026', 'ALITA', '0903843269', 'nv026@gmail.com', 'Phu Quoc', 1500,'NS1',1);
insert into NHANVIEN VALUES('NV027', 'JELIME', '0903843269', 'nv027@gmail.com', 'An Giang', 1500,'NS2',2);
insert into NHANVIEN VALUES('NV028', 'ADINA', '0903887669', 'nv028@gmail.com', 'Hau Giang', 1500,'NS3',3);
insert into NHANVIEN VALUES('NV029', 'JACK', '0903843201', 'nv029@gmail.com', 'Tra Vinh', 1500,'NS4',4);
insert into NHANVIEN VALUES('NV030', 'THOMAS', '0947543269', 'nv030@gmail.com', 'Binh Thuan', 1500,'NS5',5);

insert into NHANVIEN VALUES('NV031', 'BELINDA', '0936843269', 'nv031@gmail.com', 'Ha Noi', 1500,'KH1',1);
insert into NHANVIEN VALUES('NV032', 'Brittany', '0947510269', 'nv032@gmail.com', 'Ninh Thuan', 1500,'KH2',2);
insert into NHANVIEN VALUES('NV033', 'James', '0936843243', 'nv033@gmail.com', 'Nha Trang', 1500,'KH3',3);
insert into NHANVIEN VALUES('NV034', 'Candice', '0947800269', 'nv034@gmail.com', 'Vung Tau', 1500,'KH4',4);
insert into NHANVIEN VALUES('NV035', 'Ethan', '0936913243', 'nv035@gmail.com', 'Phan Thiet', 1500,'KH5',5);

insert into NHANVIEN VALUES('NV036', 'Morgan', '0903875269', 'nv036@gmail.com', 'Sapa', 1500,'KH1',1);
insert into NHANVIEN VALUES('NV037', 'Destiny', '0909643269', 'nv03@gmail.com', 'Nghe Tinh', 1500,'KH2',2);
insert into NHANVIEN VALUES('NV038', 'Sydney', '0903887269', 'nv038@gmail.com', 'Nghe An', 1500,'KH3',3);
insert into NHANVIEN VALUES('NV039', 'Sarah', '0903843246', 'nv039@gmail.com', 'KonTum', 1500,'KH4',4);
insert into NHANVIEN VALUES('NV040', 'Elizabeth', '0947543281', 'nv040@gmail.com', 'Phu Yen', 1500,'KH5',5);

insert into NHANVIEN VALUES('NV041', 'Justin', '0936876169', 'nv041@gmail.com', 'Da Nang', 1500,'KT1',1);
insert into NHANVIEN VALUES('NV042', 'Lucas', '0947510349', 'nv042@gmail.com', 'Binh Duong', 1500,'KT2',2);
insert into NHANVIEN VALUES('NV043', 'Jayden', '0936843044', 'nv043@gmail.com', 'Quang Binh', 1500,'KT3',3);
insert into NHANVIEN VALUES('NV044', 'Oscar', '0978400269', 'nv044@gmail.com', 'HCM', 1500,'KT4',4);
insert into NHANVIEN VALUES('NV045', 'Jayden', '0936354243', 'nv045@gmail.com', 'Binh Phuoc', 1500,'KT5',5);

-- GI�?M �?�?C
insert into nhanvien values('NV046', 'Ali', '0936876169', 'nv046@gmail.com', 'Phu Tho', 5000,'NS1',1);	-- GIÿM ĿỿC NHÂN SỰ
insert into nhanvien values('NV047', 'Henty', '0947510349', 'nv047@gmail.com', 'Lang Son', 5000,'KH1',1);	-- GIÿM ĿỿC KẾ HOẠCH
insert into nhanvien values('NV048', 'Charles', '0936843044', 'nv048@gmail.com', 'Yen Bai', 5000,'KT1',1);	--  CFO
insert into nhanvien values('NV049', 'Rachel', '0978400269', 'nv049@gmail.com', 'Nam Dinh', 5000,'NS1',1); --  CEO
insert into NHANVIEN VALUES('NV050', 'Megan', '0936354243', 'nv050@gmail.com', 'Ninh Binh', 5000,'NS1',1);  --  CTO

---------------------------------------------------------------------------------------------------------------------------------------------
-- update TRƯỞNG CHI NHÿNH
update ChiNhanh set TruongChiNhanh = 'NV016' where MaCN = 1;
update ChiNhanh set TruongChiNhanh = 'NV017' where MaCN = 2;
update ChiNhanh set TruongChiNhanh = 'NV018' where MaCN = 3;
update ChiNhanh set TruongChiNhanh = 'NV019' where MaCN = 4;
update ChiNhanh set TruongChiNhanh = 'NV020' where MaCN = 5;

-- update TRƯỞNG PHÒNG
update PhongBan set TruongPhong = 'NV001' where MaPhong = 'NS1';
update PhongBan set TruongPhong = 'NV002' where MaPhong = 'NS2';
update PhongBan set TruongPhong = 'NV003' where MaPhong = 'NS3';
update PhongBan set TruongPhong = 'NV004' where MaPhong = 'NS4';
update PhongBan set TruongPhong = 'NV005' where MaPhong = 'NS5';

update PhongBan set TruongPhong = 'NV006' where MaPhong = 'KH1';
update PhongBan set TruongPhong = 'NV007' where MaPhong = 'KH2';
update PhongBan set TruongPhong = 'NV008' where MaPhong = 'KH3';
update PhongBan set TruongPhong = 'NV009' where MaPhong = 'KH4';
update PhongBan set TruongPhong = 'NV010' where MaPhong = 'KH5';

update PhongBan set TruongPhong = 'NV011' where MaPhong = 'KT1';
update PhongBan set TruongPhong = 'NV012' where MaPhong = 'KT2';
update PhongBan set TruongPhong = 'NV013' where MaPhong = 'KT3';
update PhongBan set TruongPhong = 'NV014' where MaPhong = 'KT4';
update PhongBan set TruongPhong = 'NV015' where MaPhong = 'KT5';

------------------------------------------------------------------------------------------------------------------------------------------------

insert into DUAN values ('001', 'Project 1', 30000, 'KH1', 'NV021');
insert into DUAN values ('002', 'Project 2', 40000, 'KH2', 'NV022');
insert into DUAN values ('003', 'Project 3', 25000, 'KH3', 'NV023');
insert into DUAN values ('004', 'Project 4', 45000, 'KH4', 'NV024');
insert into DUAN values ('005', 'Project 5', 35000, 'KH5', 'NV025');
-----------------------------------------------------------------------------------------------------------------------------------------------

insert into PhanCong values ('NV021', '001', 'Leader', 200);
insert into PhanCong values ('NV022', '002', 'Leader', 200);
insert into PhanCong values ('NV023', '003', 'Leader', 200);
insert into PhanCong values ('NV024', '004', 'Leader', 200);
insert into PhanCong values ('NV025', '005', 'Leader', 200);

insert into PhanCong values ('NV031', '001', 'Participant', 100);
insert into PhanCong values ('NV032', '001', 'Participant', 100);

insert into PhanCong values ('NV033', '002', 'Participant', 100);
insert into PhanCong values ('NV034', '002', 'Participant', 100);

insert into PhanCong values ('NV035', '003', 'Participant', 100);
insert into PhanCong values ('NV036', '003', 'Participant', 100);

insert into PhanCong values ('NV037', '004', 'Participant', 100);
insert into PhanCong values ('NV038', '004', 'Participant', 100);

insert into PhanCong values ('NV039', '005', 'Participant', 100);
insert into PhanCong values ('NV040', '005', 'Participant', 100);
-------------------------------------------------------------------------------------------------------------------------------------------

insert into ChiTieu values (1, 'Food', 20, '001');
insert into ChiTieu values (2, 'Travel', 50, '001');
insert into ChiTieu values (3, 'Facilities', 100, '001');

insert into ChiTieu values (4, 'Food', 20, '002');
insert into ChiTieu values (5, 'Travel', 50, '002');
insert into ChiTieu values (6, 'Facilities', 100, '002');

insert into ChiTieu values (7, 'Food', 20, '003');
insert into ChiTieu values (8, 'Travel', 50, '003');
insert into ChiTieu values (9, 'Facilities', 100, '003');

insert into ChiTieu values (10, 'Food', 20, '004');
insert into ChiTieu values (11, 'Travel', 50, '004');
insert into ChiTieu values (12, 'Facilities', 100, '004');

insert into ChiTieu values (13, 'Food', 20, '004');
insert into ChiTieu values (14, 'Travel', 50, '004');
insert into ChiTieu values (15, 'Facilities', 100, '004');

-- Them cot ChucVu vao bang NhanVien de phan biet Giam Doc va Nhan Vien Thuong
alter table NhanVien add ChucVu numeric(1,0) default 0; -- 0: Nhan vien binh thuong, 1: Giam Doc
update NhanVien set ChucVu = 1 where manv = 'NV046' or manv = 'NV047' or manv = 'NV048' or manv = 'NV049' or manv = 'NV050';


