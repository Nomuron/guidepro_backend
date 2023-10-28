#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker;

    CREATE TABLE "user"(
        id int not null,
        login char(70) not null,
        password text not null,
        user_type char(20) not null,
        PRIMARY KEY(id)
    );

    INSERT INTO user(id, login, password, user_type)
    VALUES (1, 'Jurek', 'asdf', 'guide');

EOSQL