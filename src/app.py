import os

from flask import Flask
from flask_cors import CORS

from src.users.registration_login import login_blueprint
from src.users.users import user_blueprint
from src.utils import db, mail

app = Flask(__name__)
CORS(app)

db_host = 'db' if os.environ.get('OS_ENV', 'local') == 'docker' else 'localhost'

app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://postgres:postgres@{db_host}:5432/guidepro'
app.config['SQLALCHEMY_ECHO'] = True
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'guidepro12@gmail.com'
app.config['MAIL_PASSWORD'] = 'lxladctgjkpmjkjh'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True

db.init_app(app)
mail.init_app(app)

app.register_blueprint(login_blueprint)
app.register_blueprint(user_blueprint)


@app.route('/')
def hello():
    return '<h1> Hello world </h1>'
