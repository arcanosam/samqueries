/*
    Calculation of Revenue & Custom
    Cálculo de INSS
*/

BEGIN;

CREATE TABLE public.employee
(
  pk_employee serial NOT NULL,
  base_salary real,
  CONSTRAINT employee_id PRIMARY KEY (pk_employee)
);

INSERT INTO employee(base_salary) VALUES (500);
INSERT INTO employee(base_salary) VALUES (1000);
INSERT INTO employee(base_salary) VALUES (2000);
INSERT INTO employee(base_salary) VALUES (3000);

COMMIT;


CREATE OR REPLACE FUNCTION revenu_custom_calculation(salary real)
  RETURNS real
AS $$

	return (salary + (salary *0.12))

$$ LANGUAGE plpythonu;


SELECT
    pk_employee,
    base_salary,
    revenu_custom_calculation(employee.base_salary) ASS RevenueCustom
FROM
    employee;
