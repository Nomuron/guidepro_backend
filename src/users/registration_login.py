import json

from flask import request, Response, Blueprint

from src.users.models.User import User
from src.utils import db

login_blueprint = Blueprint('register', __name__)


@login_blueprint.route('/register', methods=['POST'])
def register_user():
    user_json = json.loads(request.data)

    new_user = User(**user_json)

    db.session.add(new_user)
    db.session.commit()

    return Response('New user were created', status=201)


@login_blueprint.route('/login', methods=['POST'])
def login():
    user_json = json.loads(request.data)

    user_query = db.select(User)\
        .filter_by(login=user_json['login'])\
        .filter(User.user_type.in_(['guide', 'tourist']))

    user = db.session.execute(user_query).scalar_one_or_none()
    print(user_json['password'])
    print(user.password)

    if user:
        if user_json['password'] == user.password:
            return Response({'Authenticated correctly': True}, 200, mimetype='application/json')

    return Response("Incorrect login or password", 400)

@login_blueprint.route('/login-moderator', methods=['POST'])
def login_moderator():
    user_json = json.loads(request.data)

    user_query = db.select(User)\
        .filter_by(login=user_json['login'])\
        .filter_by(user_type='moderator')

    user = db.session.execute(user_query).scalar_one_or_none()

    if user:
        print(user_json['password'])
        print(user.password)

        if user_json['password'] == user.password:
            return Response({'Authenticated correctly': True}, 200, mimetype='application/json')

    return Response("Incorrect login or password", 400)

