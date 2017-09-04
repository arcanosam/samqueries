CREATE OR REPLACE FUNCTION recursive_factorial(start_number integer)
returns integer
AS $$

	def fn_factorial(number):
		if number == 1:
			return number

		return number * fn_factorial(number-1)

	return fn_factorial(start_number)

$$ LANGUAGE plpythonu;

select recursive_factorial(5);
