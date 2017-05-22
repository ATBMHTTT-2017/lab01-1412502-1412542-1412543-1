alter user lbacsys identified by lbacsys account unlock;

1. Create policy by LBACSYS user
BEGIN
  sa_sysdba.create_policy (
  policy_name => 'ACCESS_DUAN',
  column_name => 'OLS_COLUMN');
END;

-- Grant role xxx_DBA to policy manager
GRANT ACCESS_DUAN_DBA TO QTV;

-- Package dùng để tạo ra các thành phần của nhãn
GRANT execute ON sa_components TO QTV;

-- Package dùng để tạo các nhãn
GRANT execute ON sa_label_admin TO QTV;

-- Package dùng để gán chính sách cho các table/schema
GRANT EXECUTE ON SA_POLICY_ADMIN TO QTV;

-- Package dùng để gán các label cho user
GRANT EXECUTE ON SA_USER_ADMIN TO QTV;

-- convert a character string to a label tag
GRANT EXECUTE ON char_to_level TO qtv;

-- 2. Define policy components
-- Create level: Normal, Limited, Confidential, High_Confidential
BEGIN
sa_components.create_level
(
  policy_name => 'Access_Duan',
  level_num   => 100,
  short_name  => 'NM',
  long_name   => 'Normal'
);
END;

BEGIN
sa_components.create_level
(
  policy_name => 'Access_Duan',
  level_num   => 200,
  short_name  => 'LM',
  long_name   => 'Limited'
);
END;

BEGIN
sa_components.create_level
(
  policy_name => 'Access_Duan',
  level_num   => 300,
  short_name  => 'C',
  long_name   => 'Confidential'
);
END;

BEGIN
sa_components.create_level
(
  policy_name => 'Access_Duan',
  level_num   => 400,
  short_name  => 'HC',
  long_name   => 'High_Confidential'
);
END;

-- Create compartment: Human resource department, Planning Department, Accounting Department
BEGIN
sa_components.create_compartment
(
  policy_name => 'Access_Duan',
  comp_num   => 100,
  short_name  => 'HR',
  long_name   => 'Human_resources'
);
END;

BEGIN
sa_components.create_compartment
(
  policy_name => 'Access_Duan',
  comp_num   => 200,
  short_name  => 'Plan',
  long_name   => 'Planning'
);
END;

BEGIN
sa_components.create_compartment
(
  policy_name => 'Access_Duan',
  comp_num   => 300,
  short_name  => 'Account',
  long_name   => 'Accounting'
);
END;

-- Create group: Main branch, TP HCM, Ha Noi, Da Nang
BEGIN
sa_components.create_group
(
  policy_name => 'Access_Duan',
  group_num   => 1000,
  short_name  => 'Main',
  long_name   => 'Main branch',
  parent_name => null
);
END;

BEGIN
SA_COMPONENTS.CREATE_GROUP
(
  POLICY_NAME => 'Access_Duan',
  GROUP_NUM   => 900,
  SHORT_NAME  => 'HN',
  LONG_NAME   => 'Ha_Noi',
  PARENT_NAME => NULL
);
END;

BEGIN
SA_COMPONENTS.CREATE_GROUP
(
  POLICY_NAME => 'Access_Duan',
  GROUP_NUM   => 800,
  SHORT_NAME  => 'HCM',
  LONG_NAME   => 'TP _Ho_Chi_Minh',
  PARENT_NAME => NULL
);
END;

BEGIN
SA_COMPONENTS.CREATE_GROUP
(
  POLICY_NAME => 'Access_Duan',
  GROUP_NUM   => 700,
  SHORT_NAME  => 'DN',
  LONG_NAME   => 'Da_Nang',
  PARENT_NAME => NULL
);
END;

-- Create label
BEGIN
SA_LABEL_ADMIN.CREATE_LABEL
(
  POLICY_NAME => 'Access_DuAn',
  LABEL_TAG   => 50,
  LABEL_VALUE => 'NM:HR:DN'
);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 100, 'NM:HR:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 150, 'NM:HR:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 200, 'NM:HR:Main');
END;
--------------------- DONE -----------------
BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 250,'NM:Plan:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 300, 'NM:Plan:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 350, 'NM:Plan:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 400, 'NM:Plan:Main');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 450,'NM:Account:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 500, 'NM:Account:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 550, 'NM:Account:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 600, 'NM:Account:Main');
END;
-------------
BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 650, 'LM:HR:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 700, 'LM:HR:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 750, 'LM:HR:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 800, 'LM:HR:Main');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 850,'LM:Plan:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 900, 'LM:Plan:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 950, 'LM:Plan:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1000, 'LM:Plan:Main');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1050,'LM:Account:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1100, 'LM:Account:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1150, 'LM:Account:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1200, 'LM:Account:Main');
END;
-----
BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1250, 'C:HR:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1300, 'C:HR:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1350, 'C:HR:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1400, 'C:HR:Main');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1450,'C:Plan:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1500, 'C:Plan:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1550, 'C:Plan:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1600, 'C:Plan:Main');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1650,'C:Account:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1700, 'C:Account:HCM');
END;
/* ALTER LABEL
BEGIN
SA_LABEL_ADMIN.ALTER_LABEL (
   policy_name      => 'ACCESS_DUAN',
   label_tag        => 1700,
   NEW_LABEL_VALUE  => 'C:ACCOUNT:HCM'
  -- NEW_DATA_LABEL    IN BOOLEAN  DEFAULT NULL
);
END;
*/
BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1750, 'C:Account:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1800, 'C:Account:Main');
END;
--------------
BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1850, 'HC:HR:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1900, 'HC:HR:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 1950, 'HC:HR:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 2000, 'HC:HR:Main');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 2050,'HC:Plan:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn',2100, 'HC:Plan:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 2150, 'HC:Plan:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 2200, 'HC:Plan:Main');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 2250,'HC:Account:DN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 2300, 'HC:Account:HCM');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 2350, 'HC:Account:HN');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_DuAn', 2400, 'HC:Account:Main');
END;

BEGIN
SA_USER_ADMIN.SET_USER_LABELS (
  POLICY_NAME      => 'ACCESS_DUAN',
  USER_NAME        => 'NV006',      -- truong phong KE HOACH chi nhanh CHINH
  MAX_READ_LABEL   => 'HC:PLAN:Main',
  MAX_WRITE_LABEL  => 'HC:PLAN:Main'
--  MIN_WRITE_LABEL  => 'NM:PLAN:Main' IN VARCHAR2 DEFAULT NULL -- CHI GOM LEVEL, KHONG CO COMPARTMENT VA GROUP
--  DEF_LABEL        IN VARCHAR2 DEFAULT NULL,
--  ROW_LABEL        IN VARCHAR2 DEFAULT NULL
);
end;

BEGIN
SA_USER_ADMIN.SET_USER_LABELS (
  POLICY_NAME      => 'ACCESS_DUAN',
  USER_NAME        => 'NV007',      -- truong phong KE HOACH chi nhanh TPHCM
  MAX_READ_LABEL   => 'HC:PLAN:HCM',
  MAX_WRITE_LABEL  => 'HC:PLAN:HCM'
--  MIN_WRITE_LABEL  => 'NM:PLAN:HCM'
--  DEF_LABEL        IN VARCHAR2 DEFAULT NULL,
--  ROW_LABEL        IN VARCHAR2 DEFAULT NULL
);
end;

BEGIN
SA_USER_ADMIN.SET_USER_LABELS (
  POLICY_NAME      => 'ACCESS_DUAN',
  USER_NAME        => 'NV008',      -- truong phong KE HOACH chi nhanh Da Nang
  MAX_READ_LABEL   => 'HC:PLAN:DN',
  MAX_WRITE_LABEL  => 'HC:PLAN:DN'
--  MIN_WRITE_LABEL  => 'NM:PLAN:DN'
--  DEF_LABEL        IN VARCHAR2 DEFAULT NULL,
--  ROW_LABEL        IN VARCHAR2 DEFAULT NULL
);
END;

BEGIN
SA_USER_ADMIN.SET_USER_LABELS (
  POLICY_NAME      => 'ACCESS_DUAN',
  USER_NAME        => 'NV0010',      -- truong phong KE HOACH chi nhanh HA NOI
  MAX_READ_LABEL   => 'HC:PLAN:HN',
  MAX_WRITE_LABEL  => 'HC:PLAN:HN'
--  MIN_WRITE_LABEL  => 'NM:PLAN:HN'
--  DEF_LABEL        IN VARCHAR2 DEFAULT NULL,
--  ROW_LABEL        IN VARCHAR2 DEFAULT NULL
);
END;

-- 4. Grant Privileges to Users and Trusted Program Units for the Policy
-- truong phong co the doc tat ca du an
BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_DUAN',
  USER_NAME    => 'NV006',
  PRIVILEGES   => 'READ'
);
END;

BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_DUAN',
  USER_NAME    => 'NV007',
  PRIVILEGES   => 'READ'
);
END;

BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_DUAN',
  USER_NAME    => 'NV008',
  PRIVILEGES   => 'READ'
);
END;

BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_DUAN',
  USER_NAME    => 'NV009',
  PRIVILEGES   => 'READ'
);
END;

BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_DUAN',
  USER_NAME    => 'NV010',
  PRIVILEGES   => 'READ'
);
END;

--  truong chi nhanh HA NOI co the doc du an cua tat ca chi nhanh

BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_DUAN',
  USER_NAME    => 'NV020',
  PRIVILEGES   => 'READ'
);
END;
*/
-- 5. Apply the Policy to a Database Table or Schema

BEGIN
  SA_POLICY_ADMIN.APPLY_TABLE_POLICY
(
    POLICY_NAME      => 'ACCESS_DUAN',
    SCHEMA_NAME      => 'QTV',
    TABLE_NAME       => 'DUAN',
    TABLE_OPTIONS    => 'NO_CONTROL'
--    label_function    IN VARCHAR2 DEFAULT NULL,
--    predicate         IN VARCHAR2 DEFAULT NULL
);
END;


-- 6. Add Policy Labels to Table Rows
UPDATE QTV.DUAN
  SET OLS_COLUMN = CHAR_TO_LABEL('ACCESS_DUAN','LM:PLAN:MAIN')
  WHERE UPPER(PHONGCHUTRI) IN ('KH1');
  
UPDATE QTV.DUAN
  SET OLS_COLUMN = CHAR_TO_LABEL('ACCESS_DUAN','LM:PLAN:HCM')
  WHERE UPPER(PHONGCHUTRI) IN ('KH2');

UPDATE QTV.DUAN
  SET OLS_COLUMN = CHAR_TO_LABEL('ACCESS_DUAN','LM:PLAN:DN')
  WHERE UPPER(PHONGCHUTRI) IN ('KH3');

UPDATE QTV.DUAN
  SET OLS_COLUMN = CHAR_TO_LABEL('ACCESS_DUAN','LM:PLAN:HN')
  WHERE UPPER(PHONGCHUTRI) IN ('KH5');

-- THAY DOI OPTION TABLE
BEGIN
SA_POLICY_ADMIN.REMOVE_TABLE_POLICY
(
  POLICY_NAME => 'ACCESS_DUAN',
  SCHEMA_NAME => 'QTV',
  TABLE_NAME => 'DUAN'
);
END;

BEGIN
SA_POLICY_ADMIN.APPLY_TABLE_POLICY
(
  POLICY_NAME => 'ACCESS_DUAN',
  SCHEMA_NAME => 'QTV',
  TABLE_NAME => 'DUAN',
  TABLE_OPTIONS => 'READ_CONTROL, WRITE_CONTROL'
);
END;



grant select on QTV.DuAn to r_TruongChiNhanh;
