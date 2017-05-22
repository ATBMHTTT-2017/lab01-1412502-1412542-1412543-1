create or replace procedure p_update_NS1(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_NS1.TenPhong,
                         PhongBan.TruongPhong = p_update_NS1.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_NS1.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_NS1.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_NS1.ChiNhanh
                     where PhongBan.MaPhong = 'NS1';
  end p_update_NS1;
  
create or replace procedure p_update_KH1(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_KH1.TenPhong,
                         PhongBan.TruongPhong = p_update_KH1.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_KH1.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_KH1.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_KH1.ChiNhanh
                     where PhongBan.MaPhong = 'KH1';
  end p_update_KH1;

create or replace procedure p_update_KT1(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_KT1.TenPhong,
                         PhongBan.TruongPhong = p_update_KT1.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_KT1.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_KT1.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_KT1.ChiNhanh
                     where PhongBan.MaPhong = 'KT1';
  end p_update_KT1;
  
  
create or replace procedure p_update_NS2(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_NS2.TenPhong,
                         PhongBan.TruongPhong = p_update_NS2.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_NS2.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_NS2.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_NS2.ChiNhanh
                     where PhongBan.MaPhong = 'NS2';
  end p_update_NS2;
  
create or replace procedure p_update_KH2(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_KH2.TenPhong,
                         PhongBan.TruongPhong = p_update_KH2.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_KH2.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_KH2.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_KH2.ChiNhanh
                     where PhongBan.MaPhong = 'KH2';
  end p_update_KH2;

create or replace procedure p_update_KT2(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_KT2.TenPhong,
                         PhongBan.TruongPhong = p_update_KT2.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_KT2.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_KT2.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_KT2.ChiNhanh
                     where PhongBan.MaPhong = 'KT2';
  end p_update_KT2;


create or replace procedure p_update_NS3(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_NS3.TenPhong,
                         PhongBan.TruongPhong = p_update_NS3.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_NS3.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_NS3.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_NS3.ChiNhanh
                     where PhongBan.MaPhong = 'NS3';
  end p_update_NS3;
  
create or replace procedure p_update_KH3(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_KH3.TenPhong,
                         PhongBan.TruongPhong = p_update_KH3.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_KH3.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_KH3.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_KH3.ChiNhanh
                     where PhongBan.MaPhong = 'KH3';
  end p_update_KH3;

create or replace procedure p_update_KT3(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_KT3.TenPhong,
                         PhongBan.TruongPhong = p_update_KT3.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_KT3.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_KT3.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_KT3.ChiNhanh
                     where PhongBan.MaPhong = 'KT3';
  end p_update_KT3;
  
  
create or replace procedure p_update_NS4(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_NS4.TenPhong,
                         PhongBan.TruongPhong = p_update_NS4.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_NS4.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_NS4.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_NS4.ChiNhanh
                     where PhongBan.MaPhong = 'NS4';
  end p_update_NS4;
  
create or replace procedure p_update_KH4(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_KH4.TenPhong,
                         PhongBan.TruongPhong = p_update_KH4.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_KH4.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_KH4.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_KH4.ChiNhanh
                     where PhongBan.MaPhong = 'KH4';
  end p_update_KH4;

create or replace procedure p_update_KT4(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_KT4.TenPhong,
                         PhongBan.TruongPhong = p_update_KT4.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_KT4.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_KT4.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_KT4.ChiNhanh
                     where PhongBan.MaPhong = 'KT4';
  end p_update_KT4;
  
  
create or replace procedure p_update_NS5(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_NS5.TenPhong,
                         PhongBan.TruongPhong = p_update_NS5.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_NS5.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_NS5.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_NS5.ChiNhanh
                     where PhongBan.MaPhong = 'NS5';
  end p_update_NS5;
  
create or replace procedure p_update_KH5(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_KH5.TenPhong,
                         PhongBan.TruongPhong = p_update_KH5.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_KH5.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_KH5.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_KH5.ChiNhanh
                     where PhongBan.MaPhong = 'KH5';
  end p_update_KH5;

create or replace procedure p_update_KT5(
  TenPhong in varchar2,
  TruongPhong in char,
  NgayNhanChuc in date,
  SoNhanVien in int,
  ChiNhanh in int) as
  begin
     update PhongBan set PhongBan.TenPhong = p_update_KT5.TenPhong,
                         PhongBan.TruongPhong = p_update_KT5.TruongPhong,
                         PhongBan.NgayNhanChuc = p_update_KT5.NgayNhanChuc,
                         PhongBan.SoNhanVien = p_update_KT5.SoNhanVien,
                         PhongBan.ChiNhanh = p_update_KT5.ChiNhanh
                     where PhongBan.MaPhong = 'KT5';
  end p_update_KT5;
  
  
  
grant execute on p_update_NS1 to NV001, NV016;
grant execute on p_update_NS2 to NV002, NV017;
grant execute on p_update_NS3 to NV003, NV018;
grant execute on p_update_NS4 to NV004, NV019;
grant execute on p_update_NS5 to NV005, NV020;

grant execute on p_update_KH1 to NV006, NV016;
grant execute on p_update_KH2 to NV007, NV017;
grant execute on p_update_KH3 to NV008, NV018;
grant execute on p_update_KH4 to NV009, NV019;
grant execute on p_update_KH5 to NV010, NV020;

grant execute on p_update_KT1 to NV011, NV016;
grant execute on p_update_KT2 to NV012, NV017;
grant execute on p_update_KT3 to NV013, NV018;
grant execute on p_update_KT4 to NV014, NV019;
grant execute on p_update_KT5 to NV015, NV020;

