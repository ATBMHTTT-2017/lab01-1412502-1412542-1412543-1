---------  ****    VPD   ****    --------------------
-- Tất cả nhân viên bình thường (trừ trưởng phòng, trưởng chi nhánh và các trưởng dự án) 
--		chỉ được phép xem thông tin nhân viên trong phòng của mình, chỉ được xem lương của bản thân
CREATE OR REPLACE VIEW v_VPD_cau1 AS
  select * from QTV.NHANVIEN;

GRANT SELECT ON v_VPD_Cau1 TO PUBLIC;

create or replace function VPD_Cau1a_XemThongTinNV (p_schema varchar2, p_obj varchar2)
Return varchar2
As
   username char(5 BYTE);
   phong char(3 byte);
   dem int :=0;
begin
    username := sys_context('userenv', 'SESSION_USER');
    IF USERNAME = 'QTV' THEN RETURN ''; END IF;

    select count(*) into dem from duan where truongda = username;
    if (dem > 0)
      then return '';
    end if;
      
     select COUNT(*) into DEM from PHONGBAN where TRUONGPHONG = USERNAME;
     if (dem > 0)
        then return '';
      end if;
      
     select COUNT(*) into DEM from CHINHANH where TRUONGCHINHANH = USERNAME;
     if (dem > 0)
        then return '';
      end if;
      
      select COUNT(*) into DEM from NhanVien where MANV = USERNAME and CHUCVU = 1;
      if (dem > 0)
        then return '';
      end if;
      
      select nv.phong into phong from NhanVien nv where manv = username;
      return 'phong = ' || q'[']' || phong || q'[']';
End VPD_Cau1a_XemThongTinNV;

begin
DBMS_RLS.ADD_POLICY(
  OBJECT_SCHEMA => 'QTV',
  OBJECT_NAME => 'V_VPD_CAU1',
  policy_name => 'VPD_CAU1A',
  function_schema => 'QTV',
  policy_function => 'VPD_CAU1A_XEMTHONGTINNV',
  statement_types => 'SELECT'
);
end; 

/* drop policy
begin 
sys.dbms_rls.drop_policy
(
  object_schema => 'QTV',
  object_name => 'v_VPD_CAU1',
  policy_name => 'VDP_CAU1A'
);
end; */

-----------------------
create or replace function VPD_Cau1b_Luong (p_schema varchar2, p_obj varchar2)
Return varchar2
As
   USERNAME char(5 byte);
   dem int := 0;
begin
    username := sys_context('userenv', 'SESSION_USER');
    if username = 'QTV' then return ''; end if;
    
      select count(*) into dem from duan where truongda = username;
      if (dem > 0)
        then return '';
      end if;
      
     select COUNT(*) into DEM from PHONGBAN where TRUONGPHONG = USERNAME;
     if (dem > 0)
        then return '';
      end if;
      
     select COUNT(*) into DEM from CHINHANH where TRUONGCHINHANH = USERNAME;
     if (dem > 0)
        then return '';
      end if;
      
      select COUNT(*) into DEM from NhanVien where MANV = USERNAME and CHUCVU = 1;
      if (dem > 0)
        then return '';
      end if;
      
      return 'MANV = ' || q'[']' || username || q'[']';
End VPD_Cau1b_Luong;

begin
SYS.dbms_rls.add_policy 
(
  OBJECT_SCHEMA => 'QTV',
  object_name => 'V_VPD_CAU1',
  policy_name => 'VPD_Cau1b',
  function_schema => 'QTV',
  policy_function => 'VPD_Cau1b_Luong',
  sec_relevant_cols=> 'Luong',
  sec_relevant_cols_opt=>dbms_rls.ALL_ROWS
);
end;