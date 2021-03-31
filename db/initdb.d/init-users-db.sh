#!/usr/bin/env bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER translator;
    CREATE DATABASE translator_text_mining_db ENCODING UTF8;
    GRANT ALL PRIVILEGES ON DATABASE translator_text_mining_db TO translator;

    ALTER USER translator WITH PASSWORD 'password123';
    ALTER USER translator WITH SUPERUSER;
EOSQL
