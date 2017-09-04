/*
    DEPENDs from table employee created on qry_calc_rev_cst.sql query
*/

BEGIN;

CREATE TABLE bill
(
  pk_bill serial NOT NULL,
  values real NOT NULL,
  transaction_opt character(1) NOT NULL,
  fk_employee integer NOT NULL,
  CONSTRAINT pri_key_autoid PRIMARY KEY (pk_bill),
  CONSTRAINT fk_bill_employee_relation FOREIGN KEY (fk_employee)
      REFERENCES employee (pk_employee) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO
    bill(
        values,
        transaction_opt,
        fk_employee
    )
VALUES (2000,'C',3);

COMMIT;

CREATE OR REPLACE FUNCTION debit_bill(employee_id integer, debit_value real)
  RETURNS real
AS $$

	qry_string = 'INSERT INTO bill(values, transaction_opt, fk_employee) VALUES(%s, \'D\', %s)' % (debit_value, employee_id)

	plan_prepare = plpy.prepare(qry_string)

	exec_result = plpy.execute(plan_prepare)


	plan_prepare = None

    qry_string = 'SELECT SUM(values) AS sum_credts FROM bill WHERE transaction_opt=\'C\' AND fk_employee=%s' % employee_id

    plan_prepare = plpy.prepare(qry_string)

    sum_credts_result = plpy.execute(plan_prepare)


	plan_prepare = None

    qry_string = 'SELECT SUM(values) AS sum_debts FROM bill WHERE transaction_opt=\'D\' AND fk_employee=%s' % employee_id

    plan_prepare = plpy.prepare(qry_string)

    sum_debts_result = plpy.execute(plan_prepare)


	calculate_over = sum_credts_result[0]['sum_credts'] - sum_debts_result[0]['sum_debts']

	return calculate_over

$$ LANGUAGE plpythonu;

SELECT debit_bill(3,1.0);
