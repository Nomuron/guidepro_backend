from src.utils import db


class User(db.Model):
    __tablename__ = 'user'

    id = db.Column(db.Integer, primary_key=True, nullable=False)
    login = db.Column(db.String(70), unique=True, nullable=False)
    password = db.Column(db.String())
    name = db.Column(db.String(60), nullable=False)
    surname = db.Column(db.String(90), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    user_type = db.Column(db.String(20), nullable=False)
