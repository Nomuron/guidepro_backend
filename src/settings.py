
import psycopg2
from flask_sqlalchemy import SQLAlchemy




def generate_postgres_con():
    return psycopg2.connect(
        database='guidepro',
        user='postgres',
        password='postgres',
        host='localhost',
        port='5432'
    )
