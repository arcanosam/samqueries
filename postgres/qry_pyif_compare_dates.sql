CREATE OR REPLACE FUNCTION compare_dates(first_date date, second_date date)
returns text
AS $$

    from datetime import datetime

    pydate_first = datetime.strptime(first_date, '%d/%m/%Y')
    pydate_second = datetime.strptime(second_date, '%d/%m/%Y')

	if pydate_first == pydate_second:
		return 'The dates area equal'

	return 'The dates are different'

$$ LANGUAGE plpythonu;

SELECT compare_dates('01/02/2011','01/02/2011');
