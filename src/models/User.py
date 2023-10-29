from src.app import db


class User(db.Model):
    __tablename__ = 'user'

    id = db.Column(db.Integer, primary_key=True)
    login = db.Column(db.String())
    password = db.Column(db.String())
    name = db.Column(db.String())
    surname = db.Column(db.String())
    user_type = db.Column(db.String())

    def __init__(self, login, password, name, surname, user_type):
        self.login = login,
        self.password = password,
        self.name = name,
        self.surname = surname,
        self.user_type = user_type
