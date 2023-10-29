import json

from flask import app, request, Response

from src.app import db
from src.models.User import User


@app.route('/register', methods=['POST'])
def register_user():
    user_json = json.loads(request.data)
    print(user_json)

    new_user = User(
        login=user_json['login'],
        password=user_json['user_json'],
        name=user_json['name'],
        surname=user_json['surname'],
        user_type=user_json['user_type']
    )
    db.session.add(new_user)
    db.session.commit()

    return Response('New user were created', status=201)