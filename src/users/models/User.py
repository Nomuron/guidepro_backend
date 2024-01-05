from sqlalchemy import Sequence

from src.utils import db


class User(db.Model):
    __tablename__ = 'user'

    id = db.Column(db.Integer, Sequence('id_user_seq', start=22), primary_key=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String())
    name = db.Column(db.String(60), nullable=False)
    surname = db.Column(db.String(90), nullable=False)
    user_type = db.Column(db.String(20), nullable=False)
    phone_number = db.Column(db.String(12), nullable=False)
    image_id = db.Column(db.String())
    is_removed = db.Column(db.Boolean, nullable=False)


class UserGuide(db.Model):
    __tablename__ = 'user_guide'

    id = db.Column(db.Integer, Sequence('id_user_guide_seq', start=7), primary_key=True, nullable=False)
    guide_type = db.Column(db.String(50), nullable=False)
    has_certificate = db.Column(db.Boolean, nullable=False)
    age = db.Column(db.Integer, nullable=False)
    gender = db.Column(db.String(1), nullable=False)
    about_me = db.Column(db.String(), nullable=False)
    interests = db.Column(db.String(), nullable=False)
