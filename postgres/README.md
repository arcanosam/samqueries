# My Queries - PostgreSQL

As said in the latest version: https://www.postgresql.org/docs/9.6/static/plpython.html

- For **Windows**:
  - Pl/Python is already include in the installer (I think)
    - Maybe you need to install [Python](https://www.python.org/)
      - If need, verify what python version is used by your extension
      - Can be different for each Postgres version
- For **Linux**:
  - Install the package of your O.S. that came with PL/Python for your Postgresql version that is installed
- For **both**:
  - In PgAdmin, **connected** with the database you want, run:
    - _CREATE EXTENSION plpythonu_;
  - OU no psql:
    - _createlang plpythonu [nome do banco]_; _(without brackets)_
