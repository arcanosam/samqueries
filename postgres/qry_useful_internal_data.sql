/*
    help to find and do the qry_count_enabled_users.sql
*/

-- list all domains
SELECT * FROM information_schema.domains;

-- get the current database (catalog)
SELECT * FROM information_schema.information_schema_catalog_name;

-- roles created by the current user
SELECT * FROM information_schema.applicable_roles;

-- list all existent roles enables
SELECT * FROM information_schema.enabled_roles;

-- list all constraints
SELECT * FROM information_schema.check_constraints ;

-- list privileges by column
SELECT * FROM information_schema.column_privileges ;

-- list privileges by table
SELECT * FROM information_schema.table_privileges ;

-- count all sequences (? I really don't remember ?)
SELECT
    COUNT(table_name)
FROM
    information_schema.table_privileges
WHERE
    table_name
LIKE
    'sequences';
