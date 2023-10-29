from flask import Flask, request, json, Response
from flask_sqlalchemy import SQLAlchemy

import src.controllers.registration_login

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:postgres@localhost:5432/guidepro'
db = SQLAlchemy(app)


@app.route('/')
def hello():
    return '<h1> Hello world </h1>'




