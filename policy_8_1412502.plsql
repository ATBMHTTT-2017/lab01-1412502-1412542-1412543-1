grant select on QTV.CHITIEU to r_TruongPhong;

create or replace function policy_8(p_schema varchar2, p_object varchar2)
return varchar2
as
  getUser char(5);
  getDuAn char(3);
begin
    getUser := sys_context('userenv', 'session_user');
    select MaDA into getDuAn from DuAn where PhongChuTri in (select MaPhong from PhongBan where TruongPhong = getUser);
    return 'DuAn = ' || getDuAn;
end;

--Gan chinh sach vao bang CHITIEU
begin
  dbms_rls.add_policy
  (
      object_schema => 'QTV',
      object_name => 'CHITIEU',
      policy_name => 'policy_8_policy',
      policy_function => 'policy_8',
      sec_relevant_cols => 'SoTien'
  );
end;
/*
begin
dbms_rls.drop_policy('QTV','CHITIEU','policy_8_policy');
end;*/