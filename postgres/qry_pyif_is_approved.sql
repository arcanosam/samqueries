CREATE OR REPLACE FUNCTION is_approved(grade real)
returns text
AS $$

	if grade > 5.0:
		return 'The student is approved'
	elif grade == None:
		return 'This is not a valid grade'

	return 'The student is not approved'

$$ LANGUAGE plpythonu;

SELECT is_approved(4.99);
