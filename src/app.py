from flask import Flask

from src.controllers.registration_login import user_blueprint
from src.utils import db

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:postgres@localhost:5432/guidepro'
app.config['SQLALCHEMY_ECHO'] = True
db.init_app(app)
app.register_blueprint(user_blueprint)


@app.route('/')
def hello():
    return '<h1> Hello world </h1>'
