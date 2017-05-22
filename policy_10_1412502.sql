-- 1. Create policy by LBACSYS user
BEGIN
  sa_sysdba.create_policy (
  policy_name => 'ACCESS_CHITIEU',
  column_name => 'row_label');
END;

-- Grant role xxx_DBA to policy manager
GRANT ACCESS_CHITIEU_DBA TO QTV;

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
-- Create level: Insensitive, Sensitive, Confidential
BEGIN
sa_components.create_level
(
  policy_name => 'Access_ChiTieu',
  level_num   => 100,
  short_name  => 'I',
  long_name   => 'Insensitive'
);
END;

BEGIN
sa_components.create_level
(
  policy_name => 'Access_ChiTieu',
  level_num   => 200,
  short_name  => 'S',
  long_name   => 'Sensitive'
);
END;

BEGIN
sa_components.create_level
(
  policy_name => 'Access_ChiTieu',
  level_num   => 300,
  short_name  => 'C',
  long_name   => 'Confidential'
);
END;

-- Create compartment: Salary, Management, Material
BEGIN
sa_components.create_compartment
(
  policy_name => 'Access_ChiTieu',
  comp_num   => 100,
  short_name  => 'Sl',
  long_name   => 'Salary'
);
END;

BEGIN
sa_components.create_compartment
(
  policy_name => 'Access_ChiTieu',
  comp_num   => 200,
  short_name  => 'Mn',
  long_name   => 'Management'
);
END;

BEGIN
sa_components.create_compartment
(
  policy_name => 'Access_ChiTieu',
  comp_num   => 300,
  short_name  => 'Mt',
  long_name   => 'Material'
);
END;

-- Create group: Employee, Manager
BEGIN
sa_components.create_group
(
  policy_name => 'Access_ChiTieu',
  group_num   => 1000,
  short_name  => 'Man',
  long_name   => 'Manager',
  parent_name => null
);
END;

BEGIN
SA_COMPONENTS.CREATE_GROUP
(
  POLICY_NAME => 'Access_ChiTieu',
  GROUP_NUM   => 900,
  SHORT_NAME  => 'Emp',
  LONG_NAME   => 'Employee',
  PARENT_NAME => 'Man'
);
END;


-- Create label
BEGIN
SA_LABEL_ADMIN.CREATE_LABEL
(
  POLICY_NAME => 'Access_ChiTieu',
  LABEL_TAG   => 50,
  LABEL_VALUE => 'I:Sl:Man'
);
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 100, 'I:Mn:Man');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 150, 'I:Mt:Man');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 200, 'S:Sl:Man');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 250,'S:Mn:Man');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 300, 'S:Mt:Man');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 350, 'C:Sl:Man');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 400, 'C:Mn:Man');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 450, 'C:Mt:Man');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 500, 'I:Sl:Emp');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 550, 'I:Mn:Emp');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 600, 'I:Mt:Emp');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 650, 'S:Sl:Emp');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 700,'S:Mn:Emp');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 750, 'S:Mt:Emp');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 800, 'C:Sl:Emp');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 850, 'C:Mn:Emp');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 900, 'C:Mt:Emp');
END;

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL( 'Access_ChiTieu', 950, 'S');
END;


-- quan ly (truong phong ke toan) co the doc tat ca thu chi 
BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_ChiTieu',
  USER_NAME    => 'NV011',
  PRIVILEGES   => 'READ'
);
END;

BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_ChiTieu',
  USER_NAME    => 'NV012',
  PRIVILEGES   => 'READ'
);
END;

BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_ChiTieu',
  USER_NAME    => 'NV013',
  PRIVILEGES   => 'READ'
);
END;

BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_ChiTieu',
  USER_NAME    => 'NV014',
  PRIVILEGES   => 'READ'
);
END;

BEGIN
SA_USER_ADMIN.SET_USER_PRIVS 
(
  POLICY_NAME  => 'ACCESS_ChiTieu',
  USER_NAME    => 'NV015',
  PRIVILEGES   => 'READ'
);
END;



-- 5. Apply the Policy to a Database Table or Schema

BEGIN
  SA_POLICY_ADMIN.APPLY_TABLE_POLICY
(
    POLICY_NAME      => 'ACCESS_ChiTieu',
    SCHEMA_NAME      => 'QTV',
    TABLE_NAME       => 'ChiTieu',
    TABLE_OPTIONS    => 'NO_CONTROL'
--    label_function    IN VARCHAR2 DEFAULT NULL,
--    predicate         IN VARCHAR2 DEFAULT NULL
);
END;


-- 6. Add Policy Labels to Table Rows
UPDATE QTV.ChiTieu
  SET row_label = CHAR_TO_LABEL('ACCESS_ChiTieu','S:Mt:Emp')
  WHERE UPPER(TenChiTieu) IN ('Facilities');
  
UPDATE QTV.ChiTieu
  SET row_label = CHAR_TO_LABEL('ACCESS_DUAN','S')
  WHERE UPPER(TenChiTieu) in ('Food');

UPDATE QTV.ChiTieu
  SET row_label = CHAR_TO_LABEL('ACCESS_DUAN','S')
  WHERE UPPER(TenChiTieu) in ('Travel');

  
-- THAY DOI OPTION TABLE
BEGIN
SA_POLICY_ADMIN.REMOVE_TABLE_POLICY
(
  POLICY_NAME => 'ACCESS_ChiTieu',
  SCHEMA_NAME => 'QTV',
  TABLE_NAME => 'ChiTieu'
);
END;

BEGIN
SA_POLICY_ADMIN.APPLY_TABLE_POLICY
(
  POLICY_NAME => 'ACCESS_ChiTieu',
  SCHEMA_NAME => 'QTV',
  TABLE_NAME => 'ChiTieu',
  TABLE_OPTIONS => 'READ_CONTROL, WRITE_CONTROL'
);
END;



