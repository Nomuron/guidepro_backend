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

    user_query = db.select(User).filter_by(login=user_json['login'])
    user = db.session.execute(user_query).scalar_one_or_none()
    print(user_json['password'])
    print(user.password)

    if user_json['password'] == user.password:
        return Response({'Authenticated correctly': True}, 200, mimetype='application/json')
    else:
        return Response("Incorrect login or password", 400)


