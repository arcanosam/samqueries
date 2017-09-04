CREATE OR REPLACE FUNCTION print_hello_name (person_name text)
  RETURNS text
AS $$

  return 'Hello ' + person_name

$$ LANGUAGE plpythonu;

SELECT print_hello_name('Samuel');
