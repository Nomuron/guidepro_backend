import psycopg2


def generate_postgres_con():
    return psycopg2.connect(
        database='guidepro',
        user='postgres',
        password='postgres',
        host='localhost',
        port='5432'
    )
