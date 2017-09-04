CREATE TYPE factors_products AS ( factors text , products integer );

CREATE OR REPLACE FUNCTION factorial_odd_numbers(start_number integer)
returns factors_products
AS $$

	factors_prod = ''
	result_product = 1
	counter = 1

	while counter <= start_number:

		if counter % 2 == 1:
			factors_prod += str(counter) + ' * '
			result_product *= counter

		counter +=1

	return {
        'factors':factors_prod[:len(factors_prod)-3],
        'products':result_product
    }

$$ LANGUAGE plpythonu;

SELECT * FROM factorial_odd_numbers(17);
