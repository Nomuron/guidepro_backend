import json

from flask import request, Response, Blueprint

from src.models.User import User
from src.utils import db

user_blueprint = Blueprint("user_blueprint", __name__)


@user_blueprint.route('/register', methods=['POST'])
def register_user():
    user_json = json.loads(request.data)

    new_user = User(
        login=user_json['login'],
        password=user_json['password'],
        name=user_json['name'],
        surname=user_json['surname'],
        email=user_json['email'],
        user_type=user_json['user_type']
    )

    db.session.add(new_user)
    db.session.commit()

    return Response('New user were created', status=201)
