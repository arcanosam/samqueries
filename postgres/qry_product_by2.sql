CREATE OR REPLACE FUNCTION product_by2(factor01 integer, factor02 integer)
  RETURNS text
AS $$

	product_result = factor01 * factor02

	return 'The product result of %s x %s is %s' % (
        factor01,
        factor02,
        product_result
    )

$$ LANGUAGE plpythonu;

SELECT * FROM product_by2(4,3);
