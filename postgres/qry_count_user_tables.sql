CREATE OR REPLACE FUNCTION count_user_tables()
  RETURNS integer
AS $$

	qry_count_tables = 'SELECT COUNT(*) count_tables FROM pg_statio_user_tables;'

	plan = plpy.prepare(qry_count_tables)

	result_count = plpy.execute(plan)

	return result_count[0]['count_tables']

$$ LANGUAGE plpythonu;

SELECT count_user_tables();
