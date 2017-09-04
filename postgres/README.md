# My Queries - PostgreSQL

As said in the latest version: https://www.postgresql.org/docs/9.6/static/plpython.html

- For **Windows**:
  - Already came with the installer
- For **Linux**:
  - Install the package of your O.S. that came with PL/Python for your Postgresql version installed
- For **both**:
  - In PgAdmin, **connected** with the database you want, run:
    - _CREATE EXTENSION plpythonu_
  - OU no psql:
    - _createlang plpythonu [nome do banco]_ - without brackets
