CREATE OR REPLACE FUNCTION count_enabled_users()
RETURNS text
AS $$

	query = 'SELECT COUNT(role_name) quantity FROM information_schema.enabled_roles'

	plan = plpy.prepare(query)

	result_count = plpy.execute(plan)

    -- console log message
	plpy.notice('DEBUG: %s' % result_count)

	return result_count[0]['quantity']

$$ LANGUAGE plpythonu;

CREATE GROUP examplegroup;

CREATE USER exampleuser WITH PASSWORD 'abc123';

select count_enabled_users();
