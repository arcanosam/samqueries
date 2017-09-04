CREATE OR REPLACE FUNCTION generante_pylist_1to20()
returns SETOF integer
AS $$

	number_list = []
	for each_number in range(1,21):
		number_list.append(each_number)

	return number_list
  
$$ LANGUAGE plpythonu;

select generante_pylist_1to20();
