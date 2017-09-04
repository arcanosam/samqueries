/*
    DEPENDs from table employee created on qry_calc_rev_cst.sql query
*/

CREATE OR REPLACE FUNCTION double_salary(employee_id integer)
  RETURNS real
AS $$

	qry_search = 'SELECT base_salary FROM employee WHERE pk_employee=%s' % (employee_id)

	plan = plpy.prepare(qry_search)

	result_query = plpy.execute(plan)

	return (result_query[0]['base_salary'] * 2)

$$ LANGUAGE plpythonu;

SELECT double_salary(3);
