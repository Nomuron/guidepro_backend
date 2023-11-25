#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker;

    CREATE TABLE "user"(
        id SERIAL NOT NULL PRIMARY KEY,
        login VARCHAR(70) NOT NULL UNIQUE,
        password text NOT NULL,
        name VARCHAR(60) NOT NULL,
        surname VARCHAR(90) NOT NULL,
        email VARCHAR(120) NOT NULL,
        user_type VARCHAR(20) NOT NULL
    );

    INSERT INTO "user"(id, login, password, name, surname, email, user_type)
    VALUES (1, 'Jurek', 'asdf', 'Jerzy', 'Jerzowski', 'a@a.pl', 'guide');

EOSQL