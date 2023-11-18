#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker;

    CREATE TABLE "user"(
        id SERIAL not null,
        login char(70) not null,
        password text not null,
        name char(60) not null,
        surname char(90) not null,
        email char(120) not null,
        user_type char(20) not null,
        PRIMARY KEY(id)
    );

    INSERT INTO "user"(id, login, password, name, surname, email, user_type)
    VALUES (1, 'Jurek', 'asdf', 'Jerzy', 'Jerzowski', 'a@a.pl', 'guide');

EOSQL