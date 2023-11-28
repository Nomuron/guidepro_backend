import json

from Crypto.Cipher import AES
from flask import request, Response, Blueprint

from src.users.models.User import User
from src.utils import db

user_blueprint = Blueprint('register', __name__)


@user_blueprint.route('/register', methods=['POST'])
def register_user():
    user_json = json.loads(request.data)

    new_user = User(**user_json)

    db.session.add(new_user)
    db.session.commit()

    return Response('New user were created', status=201)


@user_blueprint.route('/login', methods=['POST'])
def login():
    user_json = json.loads(request.data)

    user_query = db.select(User).filter_by(login=user_json['login'])
    user = db.session.execute(user_query).scalar_one_or_none()
    print(user_json['password'])
    print(user.password)

    if user_json['password'] == user.password:
        return Response({'Authenticated correctly': True}, 200)
    else:
        return Response("Incorrect login or password", 400)


@user_blueprint.route('/update_user', methods=['PUT'])
def update_user():
    user_json = json.loads(request.data)

    user_query = db.select(User).filter_by(login=user_json['login'])
    user = db.session.execute(user_query).scalar_one()

    for attribute in user.__dict__:
        if (attribute != 'login' or attribute != 'email') and attribute in user_json:
            setattr(user, attribute, user_json[attribute])

    db.session.commit()

    return Response('User updated', 200)


@user_blueprint.route('/delete_user', methods=['DELETE'])
def delete_user():
    user_json = json.loads(request.data)

    user_query = db.select(User).filter_by(login=user_json['login'])
    user = db.session.execute(user_query).scalar_one()
    print(user)

    db.session.delete(user)
    db.session.commit()

    return Response('User deleted', 204)
