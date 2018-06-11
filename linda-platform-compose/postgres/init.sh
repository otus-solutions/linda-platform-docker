#!/bin/sh
# psql --host=postgres_server --port=5432 --dbname=linda --username=postgres
psql --username=postgres -f /schemas/00_create.sql
psql --dbname=linda --username=postgres -f /schemas/01_create_schema.sql
exit
