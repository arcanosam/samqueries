CREATE OR REPLACE FUNCTION sum_seq_integers(last_number integer)
returns integer
AS $$

	return sum(
        range(
            1,
            last_number+1
        )
    )

$$ LANGUAGE plpythonu;

SELECT sum_seq_integers(100);
