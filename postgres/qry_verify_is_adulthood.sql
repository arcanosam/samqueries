/*
    DEPENDs from table employee created on qry_calc_rev_cst.sql query
*/

ALTER TABLE employee ADD COLUMN employee_age integer;

UPDATE employee SET employee_age= 22 WHERE pk_employee =1;
UPDATE employee SET employee_age= 17 WHERE pk_employee =2;
UPDATE employee SET employee_age= 34 WHERE pk_employee =3;
UPDATE employee SET employee_age= 49 WHERE pk_employee =4;

CREATE OR REPLACE FUNCTION is_adulthood(emp_age integer)
  RETURNS boolean
AS $$

	if emp_age >= 18:
		return True

	return False

$$ LANGUAGE plpythonu;

SELECT
    pk_employee,
    is_adulthood(employee_age) as adulthood
FROM
    employee;
