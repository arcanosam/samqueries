CREATE OR REPLACE FUNCTION count_server_processes()
  RETURNS integer
AS $$

	query = 'SELECT COUNT(*) count_processes FROM pg_stat_activity'

	plan = plpy.prepare(query)

	result_query = plpy.execute(plan)

	return result_query[0]['count_processes']

$$ LANGUAGE plpythonu;

SELECT count_server_processes();
