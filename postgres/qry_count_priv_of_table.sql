
CREATE OR REPLACE FUNCTION count_priv_of_table (tbl_name text)

RETURNS integer

AS $$

	query = 'SELECT COUNT(table_name) count_priv FROM information_schema.table_privileges WHERE table_name like \'%s\' ' % tbl_name;

	plan = plpy.prepare(query)

	result_count_priv = plpy.execute(plan)

	return result_count_priv[0]['count_priv']


$$ LANGUAGE plpythonu;
