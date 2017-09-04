/*
    DEPENDs from table employee created on qry_calc_rev_cst.sql query

    base salary originally is "salario mínimo" in Brazil
*/

CREATE OR REPLACE FUNCTION count_base_salaries(salary real)
  RETURNS text
AS $$

    mininum_salary_in_2011 = 545

	count_salary_min = int(salary / mininum_salary_in_2011)

	if count_salary_min > 0:
		return 'This employee receive more thane %s base salaries.' % count_salary_min

	return 'This employee receive less than 1 base salary.'

$$ LANGUAGE plpythonu;

SELECT
    pk_employee,
    base_salary,
    count_base_salaries(base_salary)
FROM
    employee;
