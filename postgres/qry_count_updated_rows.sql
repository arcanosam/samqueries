CREATE OR REPLACE FUNCTION count_updated_rows(db_name text)
  RETURNS integer
AS $$

	query = 'SELECT tup_updated FROM pg_stat_database WHERE datname=\'%s\'' % db_name

	plan = plpy.prepare(query)

	result_query = plpy.execute(plan)

	return result_query[0]['tup_updated']

$$ LANGUAGE plpythonu;

SELECT count_updated_rows('<<Your database name>>');
